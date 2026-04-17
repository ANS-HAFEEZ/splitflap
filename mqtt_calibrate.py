#!/usr/bin/env python3
"""
Split-flap MQTT Interactive Calibration Tool.
Fine-tune the offset of each module so digits align correctly.

Usage:
  1. Run this script
  2. It homes all modules, then sends '00000'
  3. For each module, press +/- to nudge the offset until the digit is centered
  4. Press 's' to save calibration to flash
"""

import time
import sys
import random

try:
    import paho.mqtt.client as mqtt
except ImportError:
    print("ERROR: paho-mqtt not installed. Run: pip install paho-mqtt")
    sys.exit(1)

# ---- Configuration ----
MQTT_BROKER = "192.168.100.241"
MQTT_PORT = 1883
MQTT_USER = ""
MQTT_PASSWORD = ""
DEVICE_NAME = "splitflap"
COMMAND_TOPIC = f"home/{DEVICE_NAME}/command"
CALIBRATE_TOPIC = f"home/{DEVICE_NAME}/calibrate"
STATE_TOPIC = f"home/{DEVICE_NAME}/state"
AVAILABILITY_TOPIC = f"home/{DEVICE_NAME}/availability"
NUM_MODULES = 5
# ------------------------

connected = False
last_state = None


def on_connect(client, userdata, flags, reason_code, properties):
    global connected
    if reason_code == 0:
        connected = True
        print("[MQTT] Connected")
        client.subscribe(STATE_TOPIC)
        client.subscribe(AVAILABILITY_TOPIC)
    else:
        print(f"[MQTT] Connection failed: {reason_code}")


def on_message(client, userdata, msg):
    global last_state
    payload = msg.payload.decode("utf-8", errors="replace")
    if msg.topic == AVAILABILITY_TOPIC:
        print(f"[DEVICE] {payload}")
    elif msg.topic == STATE_TOPIC:
        last_state = payload


def main():
    global connected

    client = mqtt.Client(
        callback_api_version=mqtt.CallbackAPIVersion.VERSION2,
        client_id=f"splitflap_cal_{random.randint(1000,9999)}",
        clean_session=True,
    )
    if MQTT_USER:
        client.username_pw_set(MQTT_USER, MQTT_PASSWORD)
    client.on_connect = on_connect
    client.on_message = on_message

    print(f"Connecting to {MQTT_BROKER}:{MQTT_PORT} ...")
    client.connect(MQTT_BROKER, MQTT_PORT, 60)
    client.loop_start()
    time.sleep(3)

    if not connected:
        print("[ERROR] Cannot connect to MQTT broker")
        sys.exit(1)

    print("\n" + "=" * 55)
    print("  SPLIT-FLAP INTERACTIVE CALIBRATION")
    print("=" * 55)

    # Step 1: Home all modules
    print("\n[1/3] Homing all modules...")
    client.publish(CALIBRATE_TOPIC, "home", qos=1)
    time.sleep(20)
    print("       Homing complete.")

    # Step 2: Send test pattern
    print("\n[2/3] Sending test pattern '00000'...")
    client.publish(COMMAND_TOPIC, "00000", qos=1)
    time.sleep(10)
    print("       All modules should show '0'.")

    # Step 3: Interactive calibration
    print("\n[3/3] Interactive offset adjustment")
    print("=" * 55)
    print()
    print("  For each module, look at the physical display.")
    print("  If the digit is not centered/aligned correctly,")
    print("  press '+' to nudge it forward (1/10th flap).")
    print()
    print("  Commands:")
    print("    +   = Nudge offset +1/10th flap (fine)")
    print("    h   = Nudge offset +1/2 revolution (coarse)")
    print("    n   = Next module (this one is OK)")
    print("    t   = Send test '12345' to verify all")
    print("    0-9 = Send that digit to current module")
    print("    s   = Save calibration to flash & exit")
    print("    q   = Quit without saving")
    print()

    current_module = 0

    while True:
        print(f"\n--- Module {current_module + 1} of {NUM_MODULES} (index {current_module}) ---")
        print(f"    Currently showing: check physical display")

        try:
            cmd = input(f"    [Module {current_module}] Command (+/h/n/t/0-9/s/q): ").strip().lower()
        except (EOFError, KeyboardInterrupt):
            print("\n[QUIT] Exiting without saving.")
            break

        if cmd == '+':
            print(f"    Nudging module {current_module} offset +1/10th flap...")
            client.publish(CALIBRATE_TOPIC, f"offset_tenth:{current_module}", qos=1)
            time.sleep(2)

        elif cmd == 'h':
            print(f"    Nudging module {current_module} offset +1/2 revolution...")
            client.publish(CALIBRATE_TOPIC, f"offset_half:{current_module}", qos=1)
            time.sleep(3)

        elif cmd == 'n':
            current_module += 1
            if current_module >= NUM_MODULES:
                print("\n    All modules calibrated!")
                save = input("    Save calibration? (y/n): ").strip().lower()
                if save == 'y':
                    print("    Saving calibration to flash...")
                    client.publish(CALIBRATE_TOPIC, "save", qos=1)
                    time.sleep(3)
                    print("    Calibration SAVED!")
                break

        elif cmd == 't':
            print("    Sending test '12345'...")
            client.publish(COMMAND_TOPIC, "12345", qos=1)
            time.sleep(8)
            print(f"    Device state: '{last_state}'")
            print("    Sending '00000' to reset...")
            client.publish(COMMAND_TOPIC, "00000", qos=1)
            time.sleep(8)

        elif cmd in '0123456789':
            # Send specific digit to just this module position
            test_str = ' ' * current_module + cmd + ' ' * (NUM_MODULES - current_module - 1)
            print(f"    Sending '{cmd}' to module {current_module}...")
            client.publish(COMMAND_TOPIC, test_str, qos=1)
            time.sleep(5)

        elif cmd == 's':
            print("    Saving calibration to flash...")
            client.publish(CALIBRATE_TOPIC, "save", qos=1)
            time.sleep(3)
            print("    Calibration SAVED!")
            break

        elif cmd == 'q':
            print("    Exiting without saving.")
            break

        else:
            print("    Unknown command. Use +/h/n/t/0-9/s/q")

    client.loop_stop()
    client.disconnect()
    print("[MQTT] Disconnected.")


if __name__ == "__main__":
    main()

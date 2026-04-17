#!/usr/bin/env python3
"""
Split-flap MQTT 5-digit counter tester.
Sends random 5-digit numbers and verifies device confirms them.

Note: Run mqtt_calibrate.py first to calibrate module offsets.
      This script does NOT recalibrate — it preserves saved offsets.
"""

import random
import time
import sys

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
STATE_TOPIC = f"home/{DEVICE_NAME}/state"
AVAILABILITY_TOPIC = f"home/{DEVICE_NAME}/availability"
NUM_DIGITS = 5
INTERVAL_SECONDS = 60
# ------------------------

connected = False
last_state = None


def on_connect(client, userdata, flags, reason_code, properties):
    global connected
    if reason_code == 0:
        connected = True
        print("[MQTT] Connected to broker")
        client.subscribe(STATE_TOPIC)
        client.subscribe(AVAILABILITY_TOPIC)
    else:
        print(f"[MQTT] Connection failed: {reason_code}")


def on_disconnect(client, userdata, flags, reason_code, properties):
    global connected
    connected = False
    print("[MQTT] Disconnected")


def on_message(client, userdata, msg):
    global last_state
    payload = msg.payload.decode("utf-8", errors="replace")
    if msg.topic == AVAILABILITY_TOPIC:
        print(f"[DEVICE] Availability: {payload}")
    elif msg.topic == STATE_TOPIC:
        last_state = payload
        print(f"  >> DEVICE confirmed: '{payload}'")


def main():
    global connected

    client = mqtt.Client(
        callback_api_version=mqtt.CallbackAPIVersion.VERSION2,
        client_id=f"splitflap_tester_{random.randint(1000,9999)}",
        clean_session=True,
    )
    if MQTT_USER:
        client.username_pw_set(MQTT_USER, MQTT_PASSWORD)
    client.on_connect = on_connect
    client.on_disconnect = on_disconnect
    client.on_message = on_message
    client.reconnect_delay_set(min_delay=1, max_delay=5)

    print(f"Connecting to MQTT broker {MQTT_BROKER}:{MQTT_PORT} ...")
    try:
        client.connect(MQTT_BROKER, MQTT_PORT, 60)
    except Exception as e:
        print(f"[ERROR] Cannot connect: {e}")
        sys.exit(1)

    client.loop_start()
    time.sleep(2)

    if not connected:
        print("[ERROR] Failed to connect to MQTT broker!")
        client.loop_stop()
        sys.exit(1)

    print("\n" + "=" * 50)
    print("  SPLIT-FLAP 5-DIGIT COUNTER TEST")
    print("=" * 50)
    print(f"Topic: {COMMAND_TOPIC}")
    print(f"Interval: {INTERVAL_SECONDS}s")
    print("Press Ctrl+C to stop.\n")

    last_number = None
    iteration = 0

    try:
        while True:
            iteration += 1
            number = random.randint(0, 99999)
            while number == last_number:
                number = random.randint(0, 99999)
            last_number = number

            display = f"{number:05d}"

            print("-" * 50)
            print(f"[{iteration:04d}] Sending: >>> {display} <<<")
            print(f"        Verify:  [{display[0]}] [{display[1]}] [{display[2]}] [{display[3]}] [{display[4]}]")

            if connected:
                client.publish(COMMAND_TOPIC, display, qos=1)
            else:
                print("  >> [WARN] Not connected, skipping")

            time.sleep(INTERVAL_SECONDS)

    except KeyboardInterrupt:
        print("\n[STOPPED] User interrupted.")
    finally:
        client.loop_stop()
        client.disconnect()
        print("[MQTT] Disconnected.")


if __name__ == "__main__":
    main()

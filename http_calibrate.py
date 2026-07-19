#!/usr/bin/env python3
"""
Split-flap HTTP Interactive Calibration Tool.
Fine-tune the offset of each module so digits align correctly.

This is the HTTP twin of mqtt_calibrate.py -- same key-press workflow, but it
talks to the ESP32's local HTTP endpoints instead of an MQTT broker, so no
broker and no extra pip packages are required (standard library only).

Usage:
  1. Set DEVICE_IP below to your display's IP.
  2. Run:  python http_calibrate.py
  3. It homes all modules, then isolates one module at a time.
  4. For each module, press +/-/h to nudge the offset until the digit is
     centered, 'n' for the next module, 's' to save to flash.
"""

import json
import sys
import time
import urllib.request
import urllib.error

# ---- Configuration ----
DEVICE_IP = "192.168.100.149"
NUM_MODULES = 5
ISOLATE_DIGIT = "0"          # digit shown on the module currently being calibrated
HTTP_TIMEOUT = 10            # seconds
# ------------------------

BASE = f"http://{DEVICE_IP}"
COMMAND_URL = f"{BASE}/api/command"
CALIBRATE_URL = f"{BASE}/api/calibrate"
STATE_URL = f"{BASE}/api/state"


def _post(url, body):
    """POST a plain-text body. text/plain matters: the ESP32 WebServer only
    exposes the raw body as arg('plain') when the content type is NOT
    form-urlencoded."""
    req = urllib.request.Request(
        url,
        data=body.encode("utf-8"),
        method="POST",
        headers={"Content-Type": "text/plain"},
    )
    with urllib.request.urlopen(req, timeout=HTTP_TIMEOUT) as r:
        return r.read().decode("utf-8", "replace")


def _get(url):
    req = urllib.request.Request(url, method="GET")
    with urllib.request.urlopen(req, timeout=HTTP_TIMEOUT) as r:
        return r.read().decode("utf-8", "replace")


def calibrate(cmd):
    try:
        _post(CALIBRATE_URL, cmd)
        return True
    except (urllib.error.URLError, OSError) as e:
        print(f"    [HTTP ERROR] calibrate '{cmd}': {e}")
        return False


def command(text):
    try:
        _post(COMMAND_URL, text)
        return True
    except (urllib.error.URLError, OSError) as e:
        print(f"    [HTTP ERROR] command '{text}': {e}")
        return False


def get_state():
    try:
        data = json.loads(_get(STATE_URL))
        return data.get("state", "?")
    except (urllib.error.URLError, OSError, ValueError) as e:
        return f"(state error: {e})"


def isolate_pattern(module, digit):
    """A display string that shows `digit` only on `module`, blanks elsewhere,
    so it is obvious which physical flap is currently under calibration."""
    s = [" "] * NUM_MODULES
    s[module] = digit
    return "".join(s)


def show_only(module, digit=ISOLATE_DIGIT):
    command(isolate_pattern(module, digit))


def force_show(module, digit=ISOLATE_DIGIT):
    """Force the module to physically move to `digit`, even if it is already
    the current target. /api/command skips a module whose target is unchanged,
    so after offset_tenth_back (which lowers the offset without moving) a plain
    re-show does nothing. Flipping through a different digit first guarantees a
    real move that realizes the new offset."""
    other = "1" if str(digit) != "1" else "2"
    command(isolate_pattern(module, other))
    time.sleep(4)
    command(isolate_pattern(module, digit))


def main():
    print(f"Connecting to {BASE} ...")
    state = get_state()
    if state.startswith("(state error"):
        print(f"[ERROR] Cannot reach device at {DEVICE_IP}: {state}")
        print("        Check the IP (DEVICE_IP) and that the display is on WiFi.")
        sys.exit(1)
    print(f"[OK] Device reachable. Current display: '{state}'")

    print("\n" + "=" * 55)
    print("  SPLIT-FLAP INTERACTIVE CALIBRATION (HTTP)")
    print("=" * 55)

    # Pause normal server polling so it can't overwrite the display mid-cal.
    print("\n[*] Pausing normal operation (server polling)...")
    calibrate("pause")

    # Step 1: Home all modules
    print("\n[1/3] Homing all modules...")
    calibrate("home")
    time.sleep(20)
    print("       Homing complete.")

    # Step 2: Test pattern
    print("\n[2/3] Sending test pattern '00000'...")
    command("00000")
    time.sleep(10)
    print("       All modules should show '0'.")

    # Step 3: Interactive calibration
    print("\n[3/3] Interactive offset adjustment")
    print("=" * 55)
    print()
    print(f"  Only ONE flap shows a number ('{ISOLATE_DIGIT}') at a time --")
    print("  that is the flap you are calibrating. The rest are blank.")
    print("  Nudge it until that number is full and centered.")
    print()
    print("  Commands:")
    print("    +   = Nudge offset +1/10th flap (fine forward)")
    print("    -   = Nudge offset -1/10th flap (fine backward)")
    print("    h   = Nudge offset +1/2 flap (coarse)")
    print("    n   = Next module (this one is OK)")
    print("    t   = Send test '12345' to verify all")
    print("    0-9 = Show that digit on the current module")
    print("    s   = Save calibration to flash & exit")
    print("    q   = Quit without saving")
    print()

    current_module = 0
    show_only(current_module)

    while True:
        print(f"\n--- Module {current_module + 1} of {NUM_MODULES} "
              f"(index {current_module}) --- the flap showing a number is this one")

        try:
            cmd = input(
                f"    [Module {current_module}] (+/-/h/n/t/0-9/s/q): "
            ).strip().lower()
        except (EOFError, KeyboardInterrupt):
            print("\n[QUIT] Exiting without saving.")
            calibrate("resume")   # let normal operation continue
            break

        if cmd == "+":
            print(f"    Nudging module {current_module} +1/10th flap...")
            calibrate(f"offset_tenth:{current_module}")
            time.sleep(2)

        elif cmd == "-":
            print(f"    Nudging module {current_module} -1/10th flap...")
            calibrate(f"offset_tenth_back:{current_module}")
            time.sleep(1)
            # Motor is forward-only and /api/command skips unchanged targets,
            # so force a real move to realize the new (lower) offset.
            force_show(current_module)
            time.sleep(3)

        elif cmd == "h":
            print(f"    Nudging module {current_module} +1/2 flap...")
            calibrate(f"offset_half:{current_module}")
            time.sleep(3)

        elif cmd == "n":
            current_module += 1
            if current_module >= NUM_MODULES:
                print("\n    All modules calibrated!")
                save = input("    Save calibration? (y/n): ").strip().lower()
                if save == "y":
                    print("    Saving calibration to flash...")
                    calibrate("save")
                    time.sleep(3)
                    print("    Calibration SAVED!")
                break
            show_only(current_module)
            time.sleep(3)

        elif cmd == "t":
            print("    Sending test '12345'...")
            command("12345")
            time.sleep(8)
            print(f"    Device state: '{get_state()}'")
            show_only(current_module)
            time.sleep(5)

        elif cmd in "0123456789":
            print(f"    Showing '{cmd}' on module {current_module}...")
            show_only(current_module, cmd)
            time.sleep(5)

        elif cmd == "s":
            print("    Saving calibration to flash...")
            calibrate("save")
            time.sleep(3)
            print("    Calibration SAVED!")
            break

        elif cmd == "q":
            print("    Exiting without saving.")
            calibrate("resume")   # let normal operation continue
            break

        else:
            print("    Unknown command. Use +/-/h/n/t/0-9/s/q")

    print("[DONE]")


if __name__ == "__main__":
    main()

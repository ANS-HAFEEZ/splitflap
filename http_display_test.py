#!/usr/bin/env python3
"""
Split-flap display test (HTTP).

Cycles every module through the same digit, forever:
    00000, 11111, 22222, ... 99999, then back to 00000, repeat.

It pauses normal server polling while running (so the cloud count can't
overwrite the test) and resumes it again when you stop with Ctrl+C.

Usage:
    python http_display_test.py

Config (device IP, number of modules) is read from http_calibrate.py.
"""

import sys
import time

import http_calibrate as hc

INTERVAL = 30.0         # seconds between display changes (hold each value this long)


def main():
    print(f"Display test -> {hc.BASE}")

    # The device can be briefly unresponsive while it does its blocking HTTPS
    # poll, so retry the pause until it gets through. Once paused, polling stops
    # and it stays responsive for the rest of the test.
    print("Pausing normal polling so the test isn't overwritten...")
    paused = False
    for attempt in range(1, 11):
        if hc.calibrate("pause"):
            paused = True
            break
        print(f"  device busy, retry {attempt}...")
        time.sleep(1)
    if not paused:
        print(f"[ERROR] Cannot reach device at {hc.DEVICE_IP}. "
              f"Check DEVICE_IP in http_calibrate.py and that it is on WiFi.")
        sys.exit(1)
    print(f"Cycling {'0' * hc.NUM_MODULES} -> {'9' * hc.NUM_MODULES} forever. "
          f"Press Ctrl+C to stop.\n")

    cycle = 0
    try:
        while True:
            cycle += 1
            for d in range(10):
                value = str(d) * hc.NUM_MODULES
                hc.command(value)
                print(f"cycle {cycle:>4}: {value}  (holding {INTERVAL:g}s)")
                time.sleep(INTERVAL)
    except KeyboardInterrupt:
        print("\nStopping. Resuming normal operation...")
        hc.calibrate("resume")
        print("Done.")


if __name__ == "__main__":
    main()

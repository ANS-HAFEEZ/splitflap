#!/usr/bin/env python3
"""
Tests / smoke-check for http_calibrate.py.

Two parts:
  * Offline unit tests (no hardware) for the pure helpers -- always run.
  * An optional LIVE check against the real display, run only with --live,
    which reads state and sends a harmless '00000' (does NOT move offsets).

Usage:
  python http_calibrate_test.py           # offline unit tests only
  python http_calibrate_test.py --live     # also probe the real device
"""

import sys

import http_calibrate as hc


def test_isolate_pattern():
    """Only the target module shows the digit; the rest are blank, and the
    string is always exactly NUM_MODULES wide."""
    hc.NUM_MODULES = 5
    assert hc.isolate_pattern(0, "8") == "8    "
    assert hc.isolate_pattern(2, "8") == "  8  "
    assert hc.isolate_pattern(4, "8") == "    8"
    for m in range(hc.NUM_MODULES):
        p = hc.isolate_pattern(m, "3")
        assert len(p) == hc.NUM_MODULES
        assert p[m] == "3"
        assert p.replace("3", " ") == " " * hc.NUM_MODULES
    print("[PASS] test_isolate_pattern")


def test_urls():
    assert hc.COMMAND_URL.endswith("/api/command")
    assert hc.CALIBRATE_URL.endswith("/api/calibrate")
    assert hc.STATE_URL.endswith("/api/state")
    assert hc.BASE.startswith("http://")
    print("[PASS] test_urls")


def run_offline():
    test_isolate_pattern()
    test_urls()
    print("\nAll offline tests passed.")


def run_live():
    print(f"\n[LIVE] Probing {hc.BASE} ...")
    state = hc.get_state()
    if state.startswith("(state error"):
        print(f"[FAIL] Device not reachable: {state}")
        return False
    print(f"[PASS] /api/state reachable, display = '{state}'")

    print("[LIVE] Sending harmless '00000' (no offset change)...")
    if not hc.command("00000"):
        print("[FAIL] /api/command POST failed")
        return False
    print("[PASS] /api/command accepted (text/plain)")
    print("\nLive check passed. Offsets were NOT modified.")
    return True


if __name__ == "__main__":
    run_offline()
    if "--live" in sys.argv:
        ok = run_live()
        sys.exit(0 if ok else 1)

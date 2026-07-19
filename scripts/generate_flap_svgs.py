#!/usr/bin/env python3
"""
Standalone script to generate split-flap SVG drawings for digits 0-9.
No OpenSCAD required. Outputs individual flap SVGs and a combined sheet.

Flap geometry matches the OpenSCAD flap_2d() module exactly:
  flap_dimensions.scad: width=54, height=43, corner_radius=3.1,
  notch_depth=3.2, notch_height=15, pin_width=1.4
"""

import os
import math
import re
import shutil
import subprocess
import tempfile

# --- Flap dimensions (mm) — from 3d/flap_dimensions.scad ---
FLAP_WIDTH = 54.0
FLAP_HEIGHT = 43.0
FLAP_CORNER_RADIUS = 3.1
FLAP_NOTCH_DEPTH = 3.2
FLAP_NOTCH_HEIGHT = 15.0
FLAP_PIN_WIDTH = 1.4
FLAP_GAP = 0.0  # gap between top and bottom halves of a digit (0 = touching)

# --- Font settings ---
FONT_FAMILY = "Arial, Helvetica, sans-serif"
FONT_WEIGHT = "600"
# Match OpenSCAD: text(size=flap_height * 0.7 * 2) where size ≈ cap height.
# SVG font-size is the em-square; for Arial, cap height ≈ 0.718 * em.
# So: font_size = (43 * 0.7 * 2) / 0.718 ≈ 83.8
CAP_HEIGHT = FLAP_HEIGHT * 0.7 * 2  # 60.2mm — desired digit height
FONT_SIZE = CAP_HEIGHT / 0.718      # ~83.8mm em-square

# --- Colors ---
FLAP_COLOR = "#1a1a1a"
FLAP_STROKE = "#333333"
LETTER_COLOR = "#ffffff"
BG_COLOR = "#111111"

# --- Characters ---
CHARACTERS = " 0123456789"

# --- Laser/print/cut sheet layout ---
# Target: 3 columns x 10 rows with the flaps themselves rotated 90 degrees,
# each row showing one digit across all columns (row 0 = "0 0 0", ... row 9
# = "9 9 9"). We build the PRE-rotation grid as len(digits) columns x
# SHEET_COPIES rows (each column is one digit, repeated down the rows), then
# rotate the whole sheet 90 degrees (SHEET_ROTATE). After rotation the flaps
# are on their side and the grid reads as SHEET_COPIES columns x 10 rows.
SHEET_DIGITS = "0123456789"
SHEET_COPIES = 3                       # copies of each digit -> columns/row
SHEET_COLS = len(SHEET_DIGITS)         # pre-rotation columns (10)
SHEET_CHARS = SHEET_DIGITS * SHEET_COPIES   # pre-rotation rows of "0-9"
SHEET_ROTATE = True                    # rotate the whole sheet 90 degrees

# Gaps / margins (mm). spacing_x + padding set the 586 mm length (kept as-is);
# spacing_y (gap between the digit copies) + flap_gap (gap between the two
# halves of a digit) set the sheet width. flap_gap is 0 so the two halves of
# each digit touch and the character reads continuously across the hinge line.
SHEET_SPACING_X = 4.0    # gap between flaps along the 586 mm length
SHEET_SPACING_Y = 3.0    # gap between the digit copies (final columns)
SHEET_PADDING = 5.0      # sheet margin
SHEET_FLAP_GAP = 0.0     # gap between the two halves of each digit (0 = touching)

# Versions to emit, by number of columns (copies of each digit per row).
# Files are suffixed with the column count, e.g. flaps_print_3col.svg.
SHEET_VERSIONS = (1, 3, 5, 10)

# --- Full stock PVC sheet (single laser-cut + UV-print file) ---
# Real sheet size. Flaps are packed to fill it: columns W wide across the
# sheet width, flaps stacked by their H (hinge) edge down the length. Both
# gaps are 0 so flaps touch on every side -- the straight hinge edges (down a
# column) and the straight side edges (between columns) coincide and de-
# duplicate into single cuts; only the pin notches stay as separate cut-ins.
MM_PER_IN = 25.4
FULL_SHEET_W_IN = 24.0
FULL_SHEET_H_IN = 54.0
FULL_SHEET_SPACING_X = 0.0   # gap between columns (0 = shared side edges)

# --- Spaced UV-print sheet (print only, hand-placed cards) ---
# Digits laid out with a gap BETWEEN digits (the two halves of one digit still
# touch). Each printed black flap contour is grown outward by PRINT_BLEED mm so
# a card placed by hand on the flatbed is fully covered even if slightly off.
PRINT_DIGIT_GAP = 10.0   # gap between neighbouring digits (mm)
PRINT_BLEED = 3.0        # oversize of the printed flap vs the real card (mm)

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
OUTPUT_DIR = os.path.join(os.path.dirname(SCRIPT_DIR), "3d", "build", "flap_svgs")

W = FLAP_WIDTH
H = FLAP_HEIGHT
R = FLAP_CORNER_RADIUS
ND = FLAP_NOTCH_DEPTH
NH = FLAP_NOTCH_HEIGHT
PW = FLAP_PIN_WIDTH


def top_flap_path(x, y):
    """SVG path for a top flap half at (x, y) top-left of bounding box.

    Top flap: rounded top corners, notch cuts on bottom (hinge) edge.

    Layout from top to bottom:
      y       : top of rounded edge
      y+R     : bottom of corner arcs
      y+H-PW-NH : top of notch cutouts
      y+H-PW  : bottom of notch cutouts
      y+H     : bottom pin edge (hinge)
    """
    y_nt = y + H - PW - NH  # notch top
    y_nb = y + H - PW       # notch bottom
    y_bot = y + H            # pin/hinge edge

    return " ".join([
        # Start top-left, after corner arc
        f"M {x+R} {y}",
        # Top edge
        f"L {x+W-R} {y}",
        # Top-right rounded corner
        f"A {R} {R} 0 0 1 {x+W} {y+R}",
        # Right side down to right notch
        f"L {x+W} {y_nt}",
        # Right notch cut-in
        f"L {x+W-ND} {y_nt}",
        f"L {x+W-ND} {y_nb}",
        f"L {x+W} {y_nb}",
        # Right side down to bottom
        f"L {x+W} {y_bot}",
        # Bottom edge (hinge)
        f"L {x} {y_bot}",
        # Left side up to left notch
        f"L {x} {y_nb}",
        # Left notch cut-in
        f"L {x+ND} {y_nb}",
        f"L {x+ND} {y_nt}",
        f"L {x} {y_nt}",
        # Left side up to corner
        f"L {x} {y+R}",
        # Top-left rounded corner
        f"A {R} {R} 0 0 1 {x+R} {y}",
        "Z",
    ])


def bottom_flap_path(x, y):
    """SVG path for a bottom flap half at (x, y) top-left of bounding box.

    Bottom flap: notch cuts on top (hinge) edge, rounded bottom corners.

    Layout from top to bottom:
      y       : top pin edge (hinge)
      y+PW    : top of notch cutouts
      y+PW+NH : bottom of notch cutouts
      y+H-R   : top of corner arcs
      y+H     : bottom of rounded edge
    """
    y_nt = y + PW        # notch top
    y_nb = y + PW + NH   # notch bottom

    return " ".join([
        # Start top-left
        f"M {x} {y}",
        # Top edge (hinge)
        f"L {x+W} {y}",
        # Right side down to right notch
        f"L {x+W} {y_nt}",
        # Right notch cut-in
        f"L {x+W-ND} {y_nt}",
        f"L {x+W-ND} {y_nb}",
        f"L {x+W} {y_nb}",
        # Right side down to corner
        f"L {x+W} {y+H-R}",
        # Bottom-right rounded corner
        f"A {R} {R} 0 0 1 {x+W-R} {y+H}",
        # Bottom edge
        f"L {x+R} {y+H}",
        # Bottom-left rounded corner
        f"A {R} {R} 0 0 1 {x} {y+H-R}",
        # Left side up to left notch
        f"L {x} {y_nb}",
        # Left notch cut-in
        f"L {x+ND} {y_nb}",
        f"L {x+ND} {y_nt}",
        f"L {x} {y_nt}",
        # Left side up to top
        f"L {x} {y}",
        "Z",
    ])


# =====================================================================
# Laser-cut output: segment-based geometry so shared edges between
# adjacent flaps can be de-duplicated into a single cut line.
# =====================================================================

# Laser colors / stroke conventions
CUT_COLOR = "#ff0000"       # red = cut
CUT_WIDTH = 0.05            # hairline (mm)
ENGRAVE_COLOR = "#000000"   # black fill = raster/vector engrave


def top_flap_segments(x, y):
    """Same outline as top_flap_path(), but as a list of primitive
    segments: ('L', x1, y1, x2, y2) or ('A', x1, y1, x2, y2, sweep)."""
    y_nt = y + H - PW - NH
    y_nb = y + H - PW
    y_bot = y + H
    return [
        ('L', x + R, y, x + W - R, y),                # top edge
        ('A', x + W - R, y, x + W, y + R, 1),         # top-right corner
        ('L', x + W, y + R, x + W, y_nt),             # right side to notch
        ('L', x + W, y_nt, x + W - ND, y_nt),         # notch in
        ('L', x + W - ND, y_nt, x + W - ND, y_nb),    # notch down
        ('L', x + W - ND, y_nb, x + W, y_nb),         # notch out
        ('L', x + W, y_nb, x + W, y_bot),             # right side to bottom
        ('L', x + W, y_bot, x, y_bot),                # bottom (hinge) edge
        ('L', x, y_bot, x, y_nb),                     # left side to notch
        ('L', x, y_nb, x + ND, y_nb),                 # notch in
        ('L', x + ND, y_nb, x + ND, y_nt),            # notch up
        ('L', x + ND, y_nt, x, y_nt),                 # notch out
        ('L', x, y_nt, x, y + R),                     # left side to corner
        ('A', x, y + R, x + R, y, 1),                 # top-left corner
    ]


def bottom_flap_segments(x, y):
    """Same outline as bottom_flap_path(), as primitive segments."""
    y_nt = y + PW
    y_nb = y + PW + NH
    return [
        ('L', x, y, x + W, y),                        # top (hinge) edge
        ('L', x + W, y, x + W, y_nt),                 # right side to notch
        ('L', x + W, y_nt, x + W - ND, y_nt),         # notch in
        ('L', x + W - ND, y_nt, x + W - ND, y_nb),    # notch down
        ('L', x + W - ND, y_nb, x + W, y_nb),         # notch out
        ('L', x + W, y_nb, x + W, y + H - R),         # right side to corner
        ('A', x + W, y + H - R, x + W - R, y + H, 1), # bottom-right corner
        ('L', x + W - R, y + H, x + R, y + H),        # bottom edge
        ('A', x + R, y + H, x, y + H - R, 1),         # bottom-left corner
        ('L', x, y + H - R, x, y_nb),                 # left side to notch
        ('L', x, y_nb, x + ND, y_nb),                 # notch in
        ('L', x + ND, y_nb, x + ND, y_nt),            # notch up
        ('L', x + ND, y_nt, x, y_nt),                 # notch out
        ('L', x, y_nt, x, y),                         # left side to top
    ]


def _seg_key(seg):
    """Canonical key for de-duplication. Endpoints are sorted so a
    segment and its reverse (shared by two neighbouring flaps) match."""
    if seg[0] == 'L':
        p1 = (round(seg[1], 2), round(seg[2], 2))
        p2 = (round(seg[3], 2), round(seg[4], 2))
        return ('L',) + tuple(sorted((p1, p2)))
    # Arc: keep radius R implicit (constant); arcs from different flaps
    # never coincide, so they are effectively never de-duplicated.
    p1 = (round(seg[1], 2), round(seg[2], 2))
    p2 = (round(seg[3], 2), round(seg[4], 2))
    return ('A',) + tuple(sorted((p1, p2)))


def _seg_to_subpath(seg):
    """Render one segment as a standalone (open) SVG sub-path."""
    if seg[0] == 'L':
        return f"M {seg[1]:.3f} {seg[2]:.3f} L {seg[3]:.3f} {seg[4]:.3f}"
    return (f"M {seg[1]:.3f} {seg[2]:.3f} "
            f"A {R} {R} 0 0 {seg[5]} {seg[3]:.3f} {seg[4]:.3f}")


def _segs_to_closed_path(segs):
    """Render a segment list as one closed path (used for clip regions)."""
    d = [f"M {segs[0][1]:.3f} {segs[0][2]:.3f}"]
    for s in segs:
        if s[0] == 'L':
            d.append(f"L {s[3]:.3f} {s[4]:.3f}")
        else:
            d.append(f"A {R} {R} 0 0 {s[5]} {s[3]:.3f} {s[4]:.3f}")
    d.append("Z")
    return " ".join(d)


# Print colors (white digits on a full-black, full-bleed background)
PRINT_BG = "#000000"
PRINT_DIGIT = "#ffffff"


def _flap_layout(chars, cols, spacing_x, spacing_y, padding, flap_gap):
    """Shared layout for the laser and print sheets so they register
    exactly. Returns (positions, viewbox_w, viewbox_h) where positions is
    a list of (index, char, top_left_x, top_left_y) per flap.

    spacing_x / spacing_y are the gaps (mm) between adjacent flaps in the
    horizontal and vertical directions respectively."""
    total_flap_h = H * 2 + flap_gap
    cell_w = W + spacing_x
    cell_h = total_flap_h + spacing_y
    rows = math.ceil(len(chars) / cols)

    vw = padding * 2 + cols * cell_w - spacing_x
    vh = padding * 2 + rows * cell_h - spacing_y

    positions = []
    for i, char in enumerate(chars):
        col = i % cols
        row = i // cols
        fx = padding + col * cell_w
        fy = padding + row * cell_h
        positions.append((i, char, fx, fy))
    return positions, vw, vh


def _digit_text(char, fx, cy, clip_id, color):
    """One clipped digit-half <text> element, vertically centered so the
    character's midline sits on `cy`. Each half is centered on its OWN
    hinge edge (top flap -> fy+H, bottom flap -> fy+H+gap), NOT on the
    middle of the flap gap -- otherwise the gap would cut a band out of
    the middle of the digit. So the top half reaches down to the midline
    and the bottom half starts at the midline: the character stays whole,
    just pulled apart by the gap."""
    cx = fx + W / 2
    text_y = cy + CAP_HEIGHT / 2
    return (f'    <text clip-path="url(#{clip_id})" '
            f'x="{cx:.2f}" y="{text_y:.2f}" '
            f'font-family="{FONT_FAMILY}" font-weight="{FONT_WEIGHT}" '
            f'font-size="{FONT_SIZE:.1f}" fill="{color}" '
            f'text-anchor="middle">{char}</text>')


def generate_print_svg(filepath, chars=SHEET_CHARS, cols=SHEET_COLS,
                       spacing_x=SHEET_SPACING_X, spacing_y=SHEET_SPACING_Y,
                       padding=SHEET_PADDING, flap_gap=SHEET_FLAP_GAP):
    """Print sheet: each flap drawn as its own black flap shape (rounded
    corners + hinge notches) with a white digit split at the hinge, on a
    plain white sheet. Uses the SAME _flap_layout / *_segments source as
    the laser and cut files, so every flap outline, size and position
    registers 1:1 across all three."""
    positions, vw, vh = _flap_layout(chars, cols, spacing_x, spacing_y,
                                     padding, flap_gap)

    defs = []
    shapes = []
    digits = []
    for i, char, fx, fy in positions:
        top = top_flap_segments(fx, fy)
        bot = bottom_flap_segments(fx, fy + H + flap_gap)
        clip_top = f"pclip-top-{i}"
        clip_bot = f"pclip-bot-{i}"
        defs.append(
            f'    <clipPath id="{clip_top}">'
            f'<path d="{_segs_to_closed_path(top)}"/></clipPath>')
        defs.append(
            f'    <clipPath id="{clip_bot}">'
            f'<path d="{_segs_to_closed_path(bot)}"/></clipPath>')
        # Filled black flap shapes (identical outline to the cut/laser files).
        shapes.append(f'    <path d="{_segs_to_closed_path(top)}" '
                      f'fill="{PRINT_BG}"/>')
        shapes.append(f'    <path d="{_segs_to_closed_path(bot)}" '
                      f'fill="{PRINT_BG}"/>')
        digits.append(_digit_text(char, fx, fy + H, clip_top, PRINT_DIGIT))
        digits.append(
            _digit_text(char, fx, fy + H + flap_gap, clip_bot, PRINT_DIGIT))

    content = [
        '  <g id="flaps">', *shapes, '  </g>',
        '  <g id="digits">', *digits, '  </g>',
    ]
    if SHEET_ROTATE:                       # rotate the whole sheet 90 degrees
        cw, ch = vh, vw
        content = [f'  <g transform="translate({vh:.2f},0) rotate(90)">',
                   *content, '  </g>']
    else:
        cw, ch = vw, vh

    svg = "\n".join([
        '<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{cw:.2f}mm" height="{ch:.2f}mm" '
        f'viewBox="0 0 {cw:.2f} {ch:.2f}">',
        '  <defs>',
        *defs,
        '  </defs>',
        f'  <rect x="0" y="0" width="{cw:.2f}" height="{ch:.2f}" '
        f'fill="#ffffff"/>',
        *content,
        '</svg>',
    ])

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(svg)

    print(f"  Generated: {os.path.basename(filepath)} "
          f"(print sheet, {cw:.1f}x{ch:.1f}mm)")


def generate_laser_svg(filepath, chars=SHEET_CHARS, cols=SHEET_COLS,
                       spacing_x=SHEET_SPACING_X, spacing_y=SHEET_SPACING_Y,
                       padding=SHEET_PADDING, flap_gap=SHEET_FLAP_GAP):
    """Laser-cut layout: flaps laid out on a grid with a gap between them.

    Cut-only -- a single red hairline CUT layer of flap outlines (with
    coincident edges between neighbours de-duplicated to a single line).
    No digits/engraving: this sheet is just for cutting the flaps. The
    outlines match the print/cut sheets exactly, so it still registers."""
    positions, vw, vh = _flap_layout(chars, cols, spacing_x, spacing_y,
                                     padding, flap_gap)

    all_segs = []       # every outline segment (with duplicates)

    for i, char, fx, fy in positions:
        all_segs.extend(top_flap_segments(fx, fy))
        all_segs.extend(bottom_flap_segments(fx, fy + H + flap_gap))

    # De-duplicate coincident edges: each shared border becomes one cut.
    seen = set()
    unique_subpaths = []
    for seg in all_segs:
        key = _seg_key(seg)
        if key in seen:
            continue
        seen.add(key)
        unique_subpaths.append(_seg_to_subpath(seg))

    cut_d = " ".join(unique_subpaths)

    content = [
        f'  <g id="cut" fill="none" stroke="{CUT_COLOR}" '
        f'stroke-width="{CUT_WIDTH}">',
        f'    <path d="{cut_d}"/>',
        '  </g>',
    ]
    if SHEET_ROTATE:                       # rotate the whole sheet 90 degrees
        cw, ch = vh, vw
        content = [f'  <g transform="translate({vh:.2f},0) rotate(90)">',
                   *content, '  </g>']
    else:
        cw, ch = vw, vh

    svg = "\n".join([
        '<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{cw:.2f}mm" height="{ch:.2f}mm" '
        f'viewBox="0 0 {cw:.2f} {ch:.2f}">',
        *content,
        '</svg>',
    ])

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(svg)

    removed = len(all_segs) - len(unique_subpaths)
    print(f"  Generated: {os.path.basename(filepath)} "
          f"({len(unique_subpaths)} cut segments, "
          f"{removed} shared edges merged)")


def generate_full_sheet_laser(filepath, sheet_w_mm, sheet_h_mm,
                              spacing_x=FULL_SHEET_SPACING_X,
                              padding=SHEET_PADDING):
    """Single laser-cut file sized to a real stock sheet (no rotation, no
    digits). Blank flap outlines packed to fill the sheet: columns W wide
    spaced spacing_x apart across the width; within each column flaps stack
    by their H (hinge) edge with NO vertical gap, alternating top/bottom so
    the straight hinge edges coincide and de-duplicate into single cuts.
    With spacing_x=0 the straight side edges between columns coincide too, so
    they de-duplicate as well and only the pin notches remain per flap.

    Returns (cols, rows, total_flaps)."""
    usable_w = sheet_w_mm - 2 * padding
    usable_h = sheet_h_mm - 2 * padding
    cols = int((usable_w + spacing_x) // (W + spacing_x))
    rows = int(usable_h // H)          # flaps touch vertically (0 gap)

    all_segs = []
    for c in range(cols):
        fx = padding + c * (W + spacing_x)
        for r in range(rows):
            fy = padding + r * H
            all_segs.extend(top_flap_segments(fx, fy) if r % 2 == 0
                            else bottom_flap_segments(fx, fy))

    seen = set()
    unique_subpaths = []
    for seg in all_segs:
        key = _seg_key(seg)
        if key in seen:
            continue
        seen.add(key)
        unique_subpaths.append(_seg_to_subpath(seg))

    cut_d = " ".join(unique_subpaths)
    svg = "\n".join([
        '<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{sheet_w_mm:.2f}mm" height="{sheet_h_mm:.2f}mm" '
        f'viewBox="0 0 {sheet_w_mm:.2f} {sheet_h_mm:.2f}">',
        f'  <g id="cut" fill="none" stroke="{CUT_COLOR}" '
        f'stroke-width="{CUT_WIDTH}">',
        f'    <path d="{cut_d}"/>',
        '  </g>',
        '</svg>',
    ])

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(svg)

    total = cols * rows
    print(f"  Generated: {os.path.basename(filepath)} "
          f"({sheet_w_mm:.0f}x{sheet_h_mm:.0f}mm, {cols} cols x {rows} rows "
          f"= {total} flaps, {len(all_segs) - len(unique_subpaths)} "
          f"shared edges merged)")
    return cols, rows, total


def generate_full_sheet_print(filepath, sheet_w_mm, sheet_h_mm,
                              spacing_x=FULL_SHEET_SPACING_X,
                              padding=SHEET_PADDING, digits=SHEET_DIGITS):
    """UV-print artwork for the full stock sheet: same flap grid / positions
    as generate_full_sheet_laser() (so print and cut register 1:1), drawn as
    black flap shapes with white digits split at the hinge. Flaps are paired
    top+bottom down each column into digits, cycling through `digits`. If the
    column has an odd flap left over it is printed as a blank flap.

    Returns (cols, rows, digit_pairs)."""
    usable_w = sheet_w_mm - 2 * padding
    usable_h = sheet_h_mm - 2 * padding
    cols = int((usable_w + spacing_x) // (W + spacing_x))
    rows = int(usable_h // H)

    defs, shapes, digit_els = [], [], []
    pairs = 0
    for c in range(cols):
        fx = padding + c * (W + spacing_x)
        r = 0
        pair_idx = 0
        while r < rows:
            fy = padding + r * H
            if r + 1 < rows:
                # full digit: top flap at fy, bottom flap directly below.
                char = digits[pair_idx % len(digits)]
                top = top_flap_segments(fx, fy)
                bot = bottom_flap_segments(fx, fy + H)
                clip_top = f"fsclip-t-{c}-{r}"
                clip_bot = f"fsclip-b-{c}-{r}"
                defs.append(f'    <clipPath id="{clip_top}">'
                            f'<path d="{_segs_to_closed_path(top)}"/></clipPath>')
                defs.append(f'    <clipPath id="{clip_bot}">'
                            f'<path d="{_segs_to_closed_path(bot)}"/></clipPath>')
                shapes.append(f'    <path d="{_segs_to_closed_path(top)}" '
                              f'fill="{PRINT_BG}"/>')
                shapes.append(f'    <path d="{_segs_to_closed_path(bot)}" '
                              f'fill="{PRINT_BG}"/>')
                # Both halves centred on the shared hinge line (fy + H).
                digit_els.append(
                    _digit_text(char, fx, fy + H, clip_top, PRINT_DIGIT))
                digit_els.append(
                    _digit_text(char, fx, fy + H, clip_bot, PRINT_DIGIT))
                pair_idx += 1
                pairs += 1
                r += 2
            else:
                # Leftover unpaired flap (matches the laser sheet's top shape).
                top = top_flap_segments(fx, fy)
                shapes.append(f'    <path d="{_segs_to_closed_path(top)}" '
                              f'fill="{PRINT_BG}"/>')
                r += 1

    svg = "\n".join([
        '<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{sheet_w_mm:.2f}mm" height="{sheet_h_mm:.2f}mm" '
        f'viewBox="0 0 {sheet_w_mm:.2f} {sheet_h_mm:.2f}">',
        '  <defs>', *defs, '  </defs>',
        f'  <rect x="0" y="0" width="{sheet_w_mm:.2f}" '
        f'height="{sheet_h_mm:.2f}" fill="#ffffff"/>',
        '  <g id="flaps">', *shapes, '  </g>',
        '  <g id="digits">', *digit_els, '  </g>',
        '</svg>',
    ])

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(svg)

    print(f"  Generated: {os.path.basename(filepath)} "
          f"({sheet_w_mm:.0f}x{sheet_h_mm:.0f}mm, {cols} cols x {rows} rows, "
          f"{pairs} digits printed)")
    return cols, rows, pairs


def _rounded_rect(x0, y0, x1, y1, r):
    """A rectangle [x0,x1]x[y0,y1] with all four corners rounded (radius r),
    as one closed path. Used for the enlarged print-only flap silhouette
    (whole digit as a SINGLE shape, so there is no seam at the hinge)."""
    return " ".join([
        f"M {x0+r:.3f} {y0:.3f}", f"L {x1-r:.3f} {y0:.3f}",
        f"A {r:.3f} {r:.3f} 0 0 1 {x1:.3f} {y0+r:.3f}",
        f"L {x1:.3f} {y1-r:.3f}",
        f"A {r:.3f} {r:.3f} 0 0 1 {x1-r:.3f} {y1:.3f}",
        f"L {x0+r:.3f} {y1:.3f}",
        f"A {r:.3f} {r:.3f} 0 0 1 {x0:.3f} {y1-r:.3f}",
        f"L {x0:.3f} {y0+r:.3f}",
        f"A {r:.3f} {r:.3f} 0 0 1 {x0+r:.3f} {y0:.3f}", "Z",
    ])


def generate_print_sheet_spaced(filepath, sheet_w_mm, sheet_h_mm,
                                bleed=PRINT_BLEED, digit_gap=PRINT_DIGIT_GAP,
                                padding=SHEET_PADDING, digits=SHEET_DIGITS):
    """UV-print-only sheet for hand placement. Digits are spaced `digit_gap`
    mm apart (but the two halves of each digit still touch), centred on the
    sheet. Each printed black flap is grown `bleed` mm outward all round so a
    card set down slightly off-position is still fully covered. The digit
    block is ONE rounded rectangle with ONE continuous digit (no split, no
    hinge seam); the physical card gap makes the real split. No cut lines.
    Returns (nx, ny, digits_total)."""
    block_w, block_h = W, 2 * H
    pitch_x, pitch_y = block_w + digit_gap, block_h + digit_gap
    nx = int((sheet_w_mm - 2 * padding + digit_gap) // pitch_x)
    ny = int((sheet_h_mm - 2 * padding + digit_gap) // pitch_y)
    used_w = nx * block_w + (nx - 1) * digit_gap
    used_h = ny * block_h + (ny - 1) * digit_gap
    off_x = (sheet_w_mm - used_w) / 2      # centre the block on the sheet
    off_y = (sheet_h_mm - used_h) / 2
    r = R + bleed

    defs, shapes, digit_els = [], [], []
    k = 0
    for row in range(ny):
        for col in range(nx):
            fx = off_x + col * pitch_x
            fy = off_y + row * pitch_y
            y_h = fy + H                     # digit centre / physical hinge
            # One rounded rect for the whole digit block -> no internal seam.
            block_d = _rounded_rect(fx - bleed, fy - bleed,
                                    fx + W + bleed, fy + 2 * H + bleed, r)
            char = digits[k % len(digits)]
            clip_id = f"spclip-{k}"
            defs.append(
                f'    <clipPath id="{clip_id}"><path d="{block_d}"/></clipPath>')
            shapes.append(f'    <path d="{block_d}" fill="{PRINT_BG}"/>')
            # One continuous digit centred on the block (no split halves).
            digit_els.append(_digit_text(char, fx, y_h, clip_id, PRINT_DIGIT))
            k += 1

    svg = "\n".join([
        '<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{sheet_w_mm:.2f}mm" height="{sheet_h_mm:.2f}mm" '
        f'viewBox="0 0 {sheet_w_mm:.2f} {sheet_h_mm:.2f}">',
        '  <defs>', *defs, '  </defs>',
        f'  <rect x="0" y="0" width="{sheet_w_mm:.2f}" '
        f'height="{sheet_h_mm:.2f}" fill="#ffffff"/>',
        '  <g id="flaps">', *shapes, '  </g>',
        '  <g id="digits">', *digit_els, '  </g>',
        '</svg>',
    ])
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(svg)

    total = nx * ny
    print(f"  Generated: {os.path.basename(filepath)} "
          f"({sheet_w_mm:.0f}x{sheet_h_mm:.0f}mm, {nx} x {ny} = {total} digits, "
          f"{digit_gap:g}mm gaps, +{bleed:g}mm bleed)")
    return nx, ny, total


def generate_print_row(filepath, digits="0123456789", bleed=PRINT_BLEED,
                       digit_gap=PRINT_DIGIT_GAP, margin=10.0):
    """UV-print-only strip: one row of the given digits (no duplication),
    same style as generate_print_sheet_spaced -- digit_gap mm between digits,
    halves touching, each digit one rounded rect + one continuous glyph (no
    hinge seam), grown `bleed` mm all round. The canvas is sized to the row
    plus `margin`. Returns (n_digits, canvas_w_mm, canvas_h_mm)."""
    n = len(digits)
    row_w = n * W + (n - 1) * digit_gap
    canvas_w = row_w + 2 * margin
    canvas_h = 2 * H + 2 * margin
    r = R + bleed
    off_x = off_y = margin

    defs, shapes, digit_els = [], [], []
    for i, char in enumerate(digits):
        fx = off_x + i * (W + digit_gap)
        fy = off_y
        y_h = fy + H
        block_d = _rounded_rect(fx - bleed, fy - bleed,
                                fx + W + bleed, fy + 2 * H + bleed, r)
        clip_id = f"rowclip-{i}"
        defs.append(
            f'    <clipPath id="{clip_id}"><path d="{block_d}"/></clipPath>')
        shapes.append(f'    <path d="{block_d}" fill="{PRINT_BG}"/>')
        digit_els.append(_digit_text(char, fx, y_h, clip_id, PRINT_DIGIT))

    svg = "\n".join([
        '<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{canvas_w:.2f}mm" height="{canvas_h:.2f}mm" '
        f'viewBox="0 0 {canvas_w:.2f} {canvas_h:.2f}">',
        '  <defs>', *defs, '  </defs>',
        f'  <rect x="0" y="0" width="{canvas_w:.2f}" '
        f'height="{canvas_h:.2f}" fill="#ffffff"/>',
        '  <g id="flaps">', *shapes, '  </g>',
        '  <g id="digits">', *digit_els, '  </g>',
        '</svg>',
    ])
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(svg)

    print(f"  Generated: {os.path.basename(filepath)} "
          f"({canvas_w:.0f}x{canvas_h:.0f}mm, {n} digits in 1 row, "
          f"{digit_gap:g}mm gaps, +{bleed:g}mm bleed)")
    return n, canvas_w, canvas_h


# =====================================================================
# Sticker / vinyl cut output (EPS): one closed cut contour per flap half,
# laid out to register onto the printed sheet.
# =====================================================================

PT_PER_MM = 72.0 / 25.4  # PostScript points per millimetre


def _arc_center_angles(x1, y1, x2, y2, r, sweep):
    """Center parameterization of the SVG arc 'A r r 0 0 {sweep} x2 y2'
    from (x1, y1). Returns (cx, cy, theta1, dtheta) in the SVG (y-down)
    frame -- same centre/radius/endpoints the SVG paths use, so the EPS
    arcs are geometrically identical, not approximated. (rx == ry == r,
    no rotation, large-arc-flag = 0; see SVG spec section F.6.5.)"""
    x1p = (x1 - x2) / 2.0
    y1p = (y1 - y2) / 2.0
    rr = r * r
    num = rr * rr - rr * y1p * y1p - rr * x1p * x1p
    den = rr * y1p * y1p + rr * x1p * x1p
    coef = math.sqrt(max(0.0, num / den))
    if sweep == 0:            # large-arc-flag (0) == sweep-flag -> negate
        coef = -coef
    cx = coef * y1p + (x1 + x2) / 2.0
    cy = -coef * x1p + (y1 + y2) / 2.0
    theta1 = math.atan2((y1 - cy) / r, (x1 - cx) / r)
    dtheta = math.atan2((y2 - cy) / r, (x2 - cx) / r) - theta1
    if sweep == 0 and dtheta > 0:
        dtheta -= 2 * math.pi
    elif sweep == 1 and dtheta < 0:
        dtheta += 2 * math.pi
    return cx, cy, theta1, dtheta


def _flap_eps_pathdef(segs, vh):
    """PostScript path-construction ops (newpath..closepath, no paint) for
    one flap-half outline using EXACT lines + arcs -- identical geometry
    to the laser/print SVG outlines. y is flipped into EPS's bottom-left
    origin so the cut registers onto the printed sheet. The caller adds
    the paint operator (stroke / clip / fill)."""
    ops = [f"newpath {segs[0][1]:.4f} {vh - segs[0][2]:.4f} moveto"]
    for seg in segs:
        if seg[0] == 'L':
            ops.append(f"{seg[3]:.4f} {vh - seg[4]:.4f} lineto")
        else:  # 'A'
            _, x1, y1, x2, y2, sweep = seg
            cx, cy, th1, dth = _arc_center_angles(x1, y1, x2, y2, R, sweep)
            a1 = -math.degrees(th1)          # y-flip negates angles
            a2 = -math.degrees(th1 + dth)
            op = "arcn" if dth > 0 else "arc"  # ...and inverts sweep direction
            ops.append(f"{cx:.4f} {vh - cy:.4f} {R:.4f} {a1:.4f} {a2:.4f} {op}")
    ops.append("closepath")
    return ops


def _eps_escape(s):
    """Escape a PostScript string literal."""
    return s.replace('\\', r'\\').replace('(', r'\(').replace(')', r'\)')


# ---------------------------------------------------------------------
# Digit outlines for the EPS. Rendering the digits with a clipped font
# breaks in cutter/sign software that ignores clipping on text (the two
# offset half-glyphs then render unclipped and overlap). To be portable
# we convert the glyphs to outline paths (via Inkscape), split each glyph
# at the hinge midline geometrically, and emit plain FILLED paths -- no
# clip operator anywhere.
# ---------------------------------------------------------------------

def _cubic(x0, y0, x1, y1, x2, y2, x3, y3, n=12):
    pts = []
    for k in range(1, n + 1):
        t = k / n
        mt = 1 - t
        a, b, c, d = mt*mt*mt, 3*mt*mt*t, 3*mt*t*t, t*t*t
        pts.append((a*x0 + b*x1 + c*x2 + d*x3, a*y0 + b*y1 + c*y2 + d*y3))
    return pts


def _quad(x0, y0, x1, y1, x2, y2, n=10):
    pts = []
    for k in range(1, n + 1):
        t = k / n
        mt = 1 - t
        a, b, c = mt*mt, 2*mt*t, t*t
        pts.append((a*x0 + b*x1 + c*x2, a*y0 + b*y1 + c*y2))
    return pts


def _flatten_path(d):
    """Parse an SVG path 'd' into a list of closed sub-paths (each a list
    of (x, y) points), flattening Bezier curves to polylines. Handles the
    absolute/relative commands Inkscape emits for glyph outlines."""
    tokens = re.findall(
        r'[MmLlHhVvCcSsQqTtAaZz]|[-+]?(?:\d*\.\d+|\d+\.?)(?:[eE][-+]?\d+)?', d)
    i, n = 0, len(tokens)
    subpaths, cur = [], None
    cx = cy = sx = sy = 0.0
    prev_ctrl = None
    prev_cmd = None

    def num():
        nonlocal i
        v = float(tokens[i]); i += 1
        return v

    while i < n:
        t = tokens[i]
        if re.match(r'[A-Za-z]', t):
            cmd = t; i += 1
        else:
            cmd = prev_cmd
            if cmd == 'M':
                cmd = 'L'
            elif cmd == 'm':
                cmd = 'l'
        rel = cmd.islower()
        C = cmd.upper()
        if C == 'M':
            x = num(); y = num()
            if rel:
                x += cx; y += cy
            if cur:
                subpaths.append(cur)
            cur = [(x, y)]; cx, cy = x, y; sx, sy = x, y; prev_ctrl = None
        elif C == 'L':
            x = num(); y = num()
            if rel:
                x += cx; y += cy
            cur.append((x, y)); cx, cy = x, y; prev_ctrl = None
        elif C == 'H':
            x = num()
            if rel:
                x += cx
            cur.append((x, cy)); cx = x; prev_ctrl = None
        elif C == 'V':
            y = num()
            if rel:
                y += cy
            cur.append((cx, y)); cy = y; prev_ctrl = None
        elif C == 'C':
            x1 = num(); y1 = num(); x2 = num(); y2 = num(); x = num(); y = num()
            if rel:
                x1 += cx; y1 += cy; x2 += cx; y2 += cy; x += cx; y += cy
            cur += _cubic(cx, cy, x1, y1, x2, y2, x, y)
            prev_ctrl = (x2, y2); cx, cy = x, y
        elif C == 'S':
            x2 = num(); y2 = num(); x = num(); y = num()
            if rel:
                x2 += cx; y2 += cy; x += cx; y += cy
            if prev_cmd and prev_cmd.upper() in ('C', 'S') and prev_ctrl:
                x1, y1 = 2*cx - prev_ctrl[0], 2*cy - prev_ctrl[1]
            else:
                x1, y1 = cx, cy
            cur += _cubic(cx, cy, x1, y1, x2, y2, x, y)
            prev_ctrl = (x2, y2); cx, cy = x, y
        elif C == 'Q':
            x1 = num(); y1 = num(); x = num(); y = num()
            if rel:
                x1 += cx; y1 += cy; x += cx; y += cy
            cur += _quad(cx, cy, x1, y1, x, y)
            prev_ctrl = (x1, y1); cx, cy = x, y
        elif C == 'T':
            x = num(); y = num()
            if rel:
                x += cx; y += cy
            if prev_cmd and prev_cmd.upper() in ('Q', 'T') and prev_ctrl:
                x1, y1 = 2*cx - prev_ctrl[0], 2*cy - prev_ctrl[1]
            else:
                x1, y1 = cx, cy
            cur += _quad(cx, cy, x1, y1, x, y)
            prev_ctrl = (x1, y1); cx, cy = x, y
        elif C == 'A':                 # arcs shouldn't appear in glyphs;
            for _ in range(5):         # consume rx ry rot laf sweep ...
                num()
            x = num(); y = num()
            if rel:
                x += cx; y += cy
            cur.append((x, y)); cx, cy = x, y; prev_ctrl = None
        elif C == 'Z':
            if cur:
                cur.append((sx, sy)); subpaths.append(cur); cur = None
            cx, cy = sx, sy; prev_ctrl = None
        prev_cmd = cmd
    if cur:
        subpaths.append(cur)
    return subpaths


def _clip_halfplane(poly, k, keep_below):
    """Sutherland-Hodgman clip of a closed polygon to a horizontal
    half-plane: y <= k (keep_below) or y >= k. Returns the clipped
    polygon (possibly empty)."""
    def inside(p):
        return p[1] <= k if keep_below else p[1] >= k
    out = []
    m = len(poly)
    for j in range(m):
        a = poly[j]
        b = poly[(j + 1) % m]
        ina, inb = inside(a), inside(b)
        if ina:
            out.append(a)
        if ina != inb and b[1] != a[1]:
            t = (k - a[1]) / (b[1] - a[1])
            out.append((a[0] + t * (b[0] - a[0]), k))
    return out


def _find_inkscape():
    p = shutil.which("inkscape")
    if p:
        return p
    for cand in (r"C:\Program Files\Inkscape\bin\inkscape.exe",
                 r"C:\Program Files\Inkscape\inkscape.exe",
                 r"C:\Program Files (x86)\Inkscape\bin\inkscape.exe"):
        if os.path.exists(cand):
            return cand
    return None


def _extract_glyphs(chars):
    """Return {char: [subpaths]} of outline points in glyph-local coords
    (x centered on 0, baseline at y=0, SVG y-down), via Inkscape's
    text-to-path. Returns None if Inkscape isn't available."""
    ink = _find_inkscape()
    if not ink:
        return None
    # Unique glyphs only -- the sheet repeats each digit, but we extract the
    # outline once and reuse it for every copy.
    glyph_chars = list(dict.fromkeys(c for c in chars if c.strip()))
    if not glyph_chars:
        return {}
    esc = lambda c: c.replace('&', '&amp;').replace('<', '&lt;')
    texts = "\n".join(
        f'<text x="{100*(i+1)}" y="80" font-family="{FONT_FAMILY}" '
        f'font-weight="{FONT_WEIGHT}" font-size="{FONT_SIZE}" '
        f'text-anchor="middle">{esc(c)}</text>'
        for i, c in enumerate(glyph_chars))
    width = 100 * (len(glyph_chars) + 2)
    svg = (f'<?xml version="1.0" encoding="UTF-8"?>\n'
           f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}mm" '
           f'height="120mm" viewBox="0 0 {width} 120">\n{texts}\n</svg>\n')
    with tempfile.TemporaryDirectory() as td:
        src = os.path.join(td, "g.svg")
        dst = os.path.join(td, "g_out.svg")
        with open(src, "w", encoding="utf-8") as f:
            f.write(svg)
        try:
            subprocess.run([ink, src, "--export-text-to-path",
                            "--export-plain-svg", f"--export-filename={dst}"],
                           check=True, stdout=subprocess.DEVNULL,
                           stderr=subprocess.DEVNULL)
        except Exception:
            return None
        if not os.path.exists(dst):
            return None
        out = open(dst, encoding="utf-8").read()
    glyphs = {}
    for m in re.finditer(r'<path[^>]*\bd="([^"]+)"', out):
        subs = _flatten_path(m.group(1))
        xs = [p[0] for sp in subs for p in sp]
        if not xs:
            continue
        idx = round(((min(xs) + max(xs)) / 2) / 100) - 1
        if 0 <= idx < len(glyph_chars):
            anchor = 100 * (idx + 1)
            glyphs.setdefault(glyph_chars[idx], []).extend(
                [[(px - anchor, py - 80) for px, py in sp] for sp in subs])
    return glyphs


def _eps_fill_polys(subpaths, vh):
    """Emit one filled EPS path (nonzero winding, so glyph holes work)
    from a list of polygons, y flipped into EPS's bottom-left origin."""
    polys = [sp for sp in subpaths if len(sp) >= 3]
    if not polys:
        return []
    ops = ["newpath"]
    for sp in polys:
        ops.append(f"{sp[0][0]:.3f} {vh - sp[0][1]:.3f} moveto")
        for (x, y) in sp[1:]:
            ops.append(f"{x:.3f} {vh - y:.3f} lineto")
        ops.append("closepath")
    ops.append("fill")
    return ops


def generate_cut_eps(filepath, chars=SHEET_CHARS, cols=SHEET_COLS,
                     spacing_x=SHEET_SPACING_X, spacing_y=SHEET_SPACING_Y,
                     padding=SHEET_PADDING, flap_gap=SHEET_FLAP_GAP):
    """Sticker / print-and-cut file (EPS). Mirrors the print sheet -- each
    flap drawn as its own black flap shape with a white digit split at the
    hinge gap, on a white sheet -- AND carries the red cut contours. The
    flap outlines use EXACT arcs with the same _flap_layout / *_segments
    source as the laser and print sheets, so every flap has byte-for-byte
    the same outline, corner radius, notches, size and position across all
    three files."""
    positions, vw, vh = _flap_layout(chars, cols, spacing_x, spacing_y,
                                     padding, flap_gap)

    bb_w = vw * PT_PER_MM
    bb_h = vh * PT_PER_MM

    glyphs = _extract_glyphs(chars)   # {char: [subpaths]} outlines, or None

    if SHEET_ROTATE:                   # page dims swap under 90-degree rotation
        bb_w, bb_h = vh * PT_PER_MM, vw * PT_PER_MM

    out = [
        "%!PS-Adobe-3.0 EPSF-3.0",
        "%%Creator: generate_flap_svgs.py",
        "%%Title: flaps_cut",
        f"%%BoundingBox: 0 0 {math.ceil(bb_w)} {math.ceil(bb_h)}",
        f"%%HiResBoundingBox: 0 0 {bb_w:.3f} {bb_h:.3f}",
        "%%EndComments",
        f"{PT_PER_MM:.6f} {PT_PER_MM:.6f} scale",   # 1 user unit = 1 mm
    ]
    if SHEET_ROTATE:                   # rotate whole sheet 90 degrees to match
        out.append(f"0 {vw:.4f} translate -90 rotate")
    out += [
        "1 setlinejoin 1 setlinecap",
        # white sheet
        f"1 1 1 setrgbcolor newpath 0 0 moveto {vw:.4f} 0 lineto "
        f"{vw:.4f} {vh:.4f} lineto 0 {vh:.4f} lineto closepath fill",
        # 1) black flap shapes (identical outline to the print/laser files)
        "0 0 0 setrgbcolor",
    ]
    for i, char, fx, fy in positions:
        out += _flap_eps_pathdef(top_flap_segments(fx, fy), vh) + ["fill"]
        out += _flap_eps_pathdef(
            bottom_flap_segments(fx, fy + H + flap_gap), vh) + ["fill"]

    # 2) white digits as pre-split FILLED outlines -- no clip, so software
    #    that ignores clipping on text can't double/overlap the glyphs.
    #    Each half is split at its own hinge edge and filled independently.
    out += ["1 1 1 setrgbcolor"]
    if glyphs:
        for i, char, fx, fy in positions:
            g = glyphs.get(char)
            if not g:
                continue
            cx = fx + W / 2
            btop = fy + H + CAP_HEIGHT / 2            # top-half baseline
            bbot = fy + H + flap_gap + CAP_HEIGHT / 2  # bottom-half baseline
            top = [_clip_halfplane([(px + cx, py + btop) for px, py in sp],
                                   fy + H, True) for sp in g]
            bot = [_clip_halfplane([(px + cx, py + bbot) for px, py in sp],
                                   fy + H + flap_gap, False) for sp in g]
            out += _eps_fill_polys(top, vh)
            out += _eps_fill_polys(bot, vh)
    else:
        # Fallback (no Inkscape): clipped base-14 text. Correct in compliant
        # interpreters, but may overlap in software that ignores clip-on-text.
        out += [
            "/ctrshow { /s exch def /by exch def /cx exch def "
            "cx s stringwidth pop 2 div sub by moveto s show } bind def",
            f"/Helvetica-Bold findfont {FONT_SIZE:.4f} scalefont setfont",
        ]
        for i, char, fx, fy in positions:
            if char.strip():
                cx = fx + W / 2
                glyph = _eps_escape(char)
                for segs, cy in (
                        (top_flap_segments(fx, fy), fy + H),
                        (bottom_flap_segments(fx, fy + H + flap_gap),
                         fy + H + flap_gap)):
                    baseline = vh - (cy + CAP_HEIGHT / 2)
                    out.append("gsave")
                    out += _flap_eps_pathdef(segs, vh)
                    out.append("clip")
                    out.append(f"{cx:.4f} {baseline:.4f} ({glyph}) ctrshow")
                    out.append("grestore")

    # 3) red cut contours (identical outline to laser/print sheets)
    n = 0
    out += ["1 0 0 setrgbcolor", "0.05 setlinewidth"]
    for i, char, fx, fy in positions:
        out += _flap_eps_pathdef(top_flap_segments(fx, fy), vh) + ["stroke"]
        out += _flap_eps_pathdef(
            bottom_flap_segments(fx, fy + H + flap_gap), vh) + ["stroke"]
        n += 2
    out.append("showpage")

    with open(filepath, "w", encoding="utf-8") as f:
        f.write("\n".join(out) + "\n")

    print(f"  Generated: {os.path.basename(filepath)} "
          f"({n} cut contours + digits, "
          f"{bb_w / PT_PER_MM:.1f}x{bb_h / PT_PER_MM:.1f}mm)")


def render_flap_pair(char, x, y, pair_id):
    """Render a top+bottom flap pair showing `char` at position (x, y).
    Returns SVG elements. (x, y) is top-left of the pair bounding box.
    """
    total_height = H * 2 + FLAP_GAP

    # Horizontal center
    cx = x + W / 2

    top_d = top_flap_path(x, y)
    bot_y = y + H + FLAP_GAP
    bot_d = bottom_flap_path(x, bot_y)

    clip_top = f"clip-top-{pair_id}"
    clip_bot = f"clip-bot-{pair_id}"

    elements = [
        f'  <defs>',
        f'    <clipPath id="{clip_top}"><path d="{top_d}"/></clipPath>',
        f'    <clipPath id="{clip_bot}"><path d="{bot_d}"/></clipPath>',
        f'  </defs>',
        # Top flap
        f'  <path d="{top_d}" fill="{FLAP_COLOR}" stroke="{FLAP_STROKE}" stroke-width="0.5"/>',
        # Bottom flap
        f'  <path d="{bot_d}" fill="{FLAP_COLOR}" stroke="{FLAP_STROKE}" stroke-width="0.5"/>',
    ]

    if char.strip():
        # Center each half on its own hinge edge (top -> y+H, bottom ->
        # y+H+gap), NOT on the middle of the gap, so the gap doesn't cut a
        # band out of the digit.
        for clip_id, cy in ((clip_top, y + H), (clip_bot, y + H + FLAP_GAP)):
            text_y = cy + CAP_HEIGHT / 2
            elements.append(
                f'  <text clip-path="url(#{clip_id})" '
                f'x="{cx}" y="{text_y:.1f}" '
                f'font-family="{FONT_FAMILY}" font-weight="{FONT_WEIGHT}" '
                f'font-size="{FONT_SIZE:.1f}" '
                f'fill="{LETTER_COLOR}" '
                f'text-anchor="middle"'
                f'>{char}</text>'
            )

    # Hinge line
    hy = y + H + FLAP_GAP / 2
    elements.append(
        f'  <line x1="{x}" y1="{hy}" x2="{x+W}" y2="{hy}" '
        f'stroke="#444444" stroke-width="0.3"/>'
    )

    return "\n".join(elements)


def generate_single_flap_svg(char, filepath, pair_id):
    padding = 4
    total_h = H * 2 + FLAP_GAP
    vw = W + padding * 2
    vh = total_h + padding * 2

    svg = "\n".join([
        f'<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{vw}mm" height="{vh}mm" '
        f'viewBox="0 0 {vw} {vh}">',
        f'  <rect width="100%" height="100%" fill="{BG_COLOR}"/>',
        render_flap_pair(char, padding, padding, pair_id),
        f'</svg>',
    ])

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(svg)


def generate_combined_svg(filepath):
    padding = 6
    spacing = 8
    cols = 6
    rows = math.ceil(len(CHARACTERS) / cols)

    total_flap_h = H * 2 + FLAP_GAP
    cell_w = W + spacing
    cell_h = total_flap_h + spacing

    vw = padding * 2 + cols * cell_w - spacing
    vh = padding * 2 + rows * cell_h - spacing

    elements = [
        f'<?xml version="1.0" encoding="UTF-8"?>',
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'width="{vw}mm" height="{vh}mm" '
        f'viewBox="0 0 {vw} {vh}">',
        f'  <rect width="100%" height="100%" fill="{BG_COLOR}"/>',
    ]

    for i, char in enumerate(CHARACTERS):
        col = i % cols
        row = i // cols
        fx = padding + col * cell_w
        fy = padding + row * cell_h
        elements.append(f'  <!-- char: "{char}" -->')
        elements.append(render_flap_pair(char, fx, fy, f"c{i}"))

        label = char if char.strip() else "blank"
        lx = fx + W / 2
        ly = fy + total_flap_h + spacing * 0.7
        elements.append(
            f'  <text x="{lx}" y="{ly}" font-family="{FONT_FAMILY}" '
            f'font-size="3.5" fill="#888888" text-anchor="middle">{label}</text>'
        )

    elements.append('</svg>')

    with open(filepath, "w", encoding="utf-8") as f:
        f.write("\n".join(elements))


def generate_print_pdf(svg_path, pdf_path):
    """Convert the print sheet SVG to PDF (for the printer) via Inkscape,
    with text flattened to outline paths so the file is self-contained and
    the digits render identically everywhere. Skipped with a note if
    Inkscape isn't available."""
    ink = _find_inkscape()
    if not ink:
        print("  Skipped: flaps_print.pdf (Inkscape not found on PATH or in "
              "the usual install dirs)")
        return
    try:
        subprocess.run([ink, svg_path, "--export-type=pdf",
                        "--export-text-to-path",
                        f"--export-filename={pdf_path}"],
                       check=True, stdout=subprocess.DEVNULL,
                       stderr=subprocess.DEVNULL)
        print(f"  Generated: {os.path.basename(pdf_path)} (print PDF)")
    except Exception as e:  # noqa: BLE001 - report and continue
        print(f"  Skipped: flaps_print.pdf ({e})")


def generate_sheet_set(copies):
    """Generate the laser / print / cut / pdf sheet set with `copies`
    columns (copies of each digit per row). Files are suffixed with the
    column count, e.g. flaps_print_3col.svg."""
    chars = SHEET_DIGITS * copies
    cols = len(SHEET_DIGITS)
    suffix = f"_{copies}col"

    laser_path = os.path.join(OUTPUT_DIR, f"flaps_laser{suffix}.svg")
    generate_laser_svg(laser_path, chars=chars, cols=cols)

    print_path = os.path.join(OUTPUT_DIR, f"flaps_print{suffix}.svg")
    generate_print_svg(print_path, chars=chars, cols=cols)

    cut_path = os.path.join(OUTPUT_DIR, f"flaps_cut{suffix}.eps")
    generate_cut_eps(cut_path, chars=chars, cols=cols)

    pdf_path = os.path.join(OUTPUT_DIR, f"flaps_print{suffix}.pdf")
    generate_print_pdf(print_path, pdf_path)


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    for i, char in enumerate(CHARACTERS):
        label = char if char.strip() else "blank"
        filepath = os.path.join(OUTPUT_DIR, f"flap_{label}.svg")
        generate_single_flap_svg(char, filepath, f"s{i}")
        print(f"  Generated: flap_{label}.svg")

    combined_path = os.path.join(OUTPUT_DIR, "flaps_combined.svg")
    generate_combined_svg(combined_path)
    print(f"  Generated: flaps_combined.svg")

    for copies in SHEET_VERSIONS:
        print(f"\n  [{copies}-column version]")
        generate_sheet_set(copies)

    print(f"\n  [full stock sheet]")
    sheet_w_mm = FULL_SHEET_W_IN * MM_PER_IN
    sheet_h_mm = FULL_SHEET_H_IN * MM_PER_IN
    tag = f"{FULL_SHEET_W_IN:g}x{FULL_SHEET_H_IN:g}in"

    laser_path = os.path.join(OUTPUT_DIR, f"flaps_laser_sheet_{tag}.svg")
    cols, rows, total = generate_full_sheet_laser(
        laser_path, sheet_w_mm, sheet_h_mm)

    print_path = os.path.join(OUTPUT_DIR, f"flaps_print_sheet_{tag}.svg")
    generate_full_sheet_print(print_path, sheet_w_mm, sheet_h_mm)

    pdf_path = os.path.join(OUTPUT_DIR, f"flaps_print_sheet_{tag}.pdf")
    generate_print_pdf(print_path, pdf_path)

    print(f"    -> {total} flaps ({cols} across x {rows} tall) "
          f"on a {FULL_SHEET_W_IN:g}x{FULL_SHEET_H_IN:g} in sheet")

    print(f"\n  [spaced UV-print sheet]")
    spaced_svg = os.path.join(OUTPUT_DIR, f"flaps_print_uv_spaced_{tag}.svg")
    nx, ny, ndig = generate_print_sheet_spaced(spaced_svg, sheet_w_mm,
                                               sheet_h_mm)
    spaced_pdf = os.path.join(OUTPUT_DIR, f"flaps_print_uv_spaced_{tag}.pdf")
    generate_print_pdf(spaced_svg, spaced_pdf)
    print(f"    -> {ndig} digits ({nx} x {ny}) with {PRINT_DIGIT_GAP:g}mm gaps, "
          f"+{PRINT_BLEED:g}mm print bleed per flap")

    print(f"\n  [single-row UV-print 0-9]")
    row_svg = os.path.join(OUTPUT_DIR, "flaps_print_uv_row_0-9.svg")
    generate_print_row(row_svg, digits="0123456789")
    row_pdf = os.path.join(OUTPUT_DIR, "flaps_print_uv_row_0-9.pdf")
    generate_print_pdf(row_svg, row_pdf)

    print(f"\nAll files written to: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()

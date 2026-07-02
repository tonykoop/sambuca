# cad/ — operational notes

This folder holds the SolidWorks design package. The canonical authoritative source for all dimensions is `SAM-000_master-equations.txt`; everything else in this folder consumes those values.

> **Don't edit `SAM-000_master-equations.txt` without coordinating** — it's the single source-of-truth for the design, and the variables are referenced by name throughout the build packet (`bom.csv`, `cut-list.csv`, `validation.csv`, `wolfram/sambuca-acoustics-starter.wl`).

## File map

| File | Status | Purpose |
|---|---|---|
| `SAM-000_master-equations.txt` | locked | Authoritative global equations. Paste into SolidWorks Equations Manager. |
| `sambuca.scad` | pending_measurement | Parametric OpenSCAD boat-hull/neck envelope traced to `SAM-000_master-equations.txt` + `../family-spec.csv`. Renders clean; NOT fabrication authority and does NOT supersede the SolidWorks MasterLayout rebuild. |
| `SW-MIGRATION-CHECKLIST.md` | in-progress | Step-by-step rebuild of the SolidWorks MasterLayout from kora Pack-and-Go. Path A recommended. |
| `SAM-000_MasterLayout.SLDPRT` | kora-inherited geometry | Pack-and-Go output. Internal geometry is still kora-shaped; rebuild per the migration checklist. |
| `SAM-000_SAMBUCA.SLDASM` | kora-inherited mates | Assembly file. Re-mate after MasterLayout rebuild. |
| `SAM-000_Sambuca_ALL_CONFIGS_dimensions.csv` | to be generated | Design-table export. Produced after the model rebuilds cleanly across all 5 configurations. |

## CAD workflow gates

Three gates before declaring CAD work complete (per the migration checklist):

1. **MasterLayout rebuilds with no errors** across SAM-13-ROOT, SAM-19-MID, SAM-25-CONCERT, SAM-13-AE, SAM-13-MULE.
2. **Design-table dimensions export to CSV** cleanly — this CSV becomes a packet artifact.
3. **Assembly opens with all mates resolved** — required before producing the drawings package.

## CAD-to-packet handoff

Once gates close:

- Export drawings per `../drawings/README.md`.
- Run `scripts/generate_drawings.py` from the instrument-maker-v4 skill against this folder, or hand-draft per the drawing brief.
- Run `scripts/generate_sw_design_table.py` against `../family-spec.csv` to produce a SolidWorks design-table xlsx if needed for round-trip.
- Update `../validation.csv` row V-D-* targets if any dimensions changed during CAD rebuild.

## Family-table configurations

The design-table will carry these 5 rows:

| Configuration | body_length_mm | string_count | f_min_hz | f_max_hz |
|---|---|---|---|---|
| SAM-13-ROOT | 650 | 13 | 196.0 | 659.3 (E5) |
| SAM-19-MID | 850 | 19 | 146.8 | 783.99 (G5) |
| SAM-25-CONCERT | 1050 | 25 | 110.0 | 880.0 (A5) |
| SAM-13-AE | 650 | 13 | 196.0 | 659.3 |
| SAM-13-MULE | 650 | 13 | 196.0 | 659.3 |

> The f_max values above target the G-major-family build. For the A-major retune SKU, f_max for SAM-13 becomes 740.0 (F#5) and the string set changes; no neck modifications.

## Notes on the dimensional check vs photo evidence

The second photo set (2026-05-16) added two parametric features that were added to `SAM-000_master-equations.txt` after Tony's review:

- `inlay_strip_count`, `inlay_strip_width_mm`, `inlay_strip_gap_mm` — multi-strip lapis band parameters.
- `bow_panel_length_mm`, `bow_panel_width_mm`, `bow_panel_depth_mm`, `bow_panel_x_from_stern_mm` — bow-end soundboard inlay panel.

These need to be reflected in the SolidWorks MasterLayout sketches when Step 4 of `SW-MIGRATION-CHECKLIST.md` (build master sketches) reaches the soundboard. Specifically:

- The Soundboard sketch needs the inlay-band pocket as 5 parallel strips with spacers (not a single binding strip).
- The Soundboard sketch needs the rectangular bow-panel pocket at `bow_panel_x_from_stern_mm`.

Suggest updating `SW-MIGRATION-CHECKLIST.md` Step 4 to add a sub-step 4l ("Soundboard inlay program: 5 parallel strips + bow panel pocket") at the end.

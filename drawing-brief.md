# Sambuca — Drawing Brief

Asset list for the manufacturing drawings package. All drawings are SVG-first (vector source-of-truth in `drawings/`), exported to PDF for the print packet. Title block conventions match the kora repo.

> **Status:** every drawing in this brief is a *placeholder spec* — SolidWorks model rebuild per `cad/SW-MIGRATION-CHECKLIST.md` must complete before any of these can be generated from CAD. Manual SVGs from the master-equations dimensions can be drafted in the interim.

## Title block conventions

Every sheet carries:

- **Project:** SAMBUCA
- **Variant:** SAM-13-ROOT (or family-spec member ID)
- **Sheet:** [number] of [total]
- **Title:** [sheet title]
- **Scale:** 1:2 default; detail callouts at 1:1 or 2:1
- **Units:** mm
- **Rev:** A (initial) / B (post-validation) / C (post-cultural-review)
- **Date:** ISO 8601
- **Author:** Tony Koop
- **Sources:** `cad/SAM-000_master-equations.txt`, BM 121198 anchor measurements, second photo set 2026-05-16

## Sheets — SAM-13-ROOT build target

| Sheet | Title | View(s) | Scale | Key dimensions | Notes |
|---|---|---|---|---|---|
| 01 | Overview, front | Front elevation | 1:2 | `body_length_mm`, `instrument_height_mm`, `body_width_mm`, neck-curve overall | The "hero" technical view. Shows the J-curve of the neck, the brass collar, the lapis band, the bow-end inlay panel. |
| 02 | Overview, side (right) | Right elevation | 1:2 | `body_depth_mm`, bow-lift tangent rotation (10–15°), neck arc + lean | Shows the boat profile with bow lift, the curved neck path, and the keel-port forward-tilt angle. |
| 03 | Overview, top | Top plan | 1:2 | Plan view of soundboard with inlay band, bow panel, string-holder strip layout, tuner-position dots | Inlay band shown as 5 parallel strips. |
| 04 | Hull side profile (detail) | Right elevation enlarged | 1:1 | All side-profile dimensions, bow lift, keel curvature radius, stub-foot positions | Construction-critical view for the CNC hull fixture. |
| 05 | Hull top profile (detail) | Top plan enlarged | 1:1 | Beam dimensions at five stations along the body length | For CNC fixture and stave-bevel angles. |
| 06 | Hull cross-section (3 stations) | Bow / midship / stern sections | 1:1 | Wall thickness, internal volume, internal brace positions, stub-foot section | Confirms `hull_wall_mm` is 6 mm at three points. |
| 07 | Neck arc and cross-section | Right elevation + 3 cross-sections along arc | 1:1 | `neck_arc_length_mm`, `neck_curve_radius_mm`, `neck_lean_deg`, `neck_width_mm`, `neck_depth_mm` | Tuner-hole positions on the neck face. |
| 08 | Neck-to-body scarf joint + brass collar | Section + exploded | 1:1 | Scarf 8:1 angle, collar height, dowel position | The most critical structural joint. |
| 09 | String-holder strip detail | Plan + section + tie-hole pattern | 2:1 | Strip dimensions, hole spacing, hole diameter, hide-glue mounting note | Position annotated as "voicing-determined". |
| 10 | Soundboard inlay program | Plan with all inlay elements | 1:2 | Multi-strip lapis band (5 strips × 1.5 mm + 4 spacers × 0.8 mm), bow-end inlay panel (100 × 60 × 1.5), Heifer Zephyr placement A/B callouts | CNC inlay sequence: route entire pocket, then inlay. |
| 11 | Keel port detail | Bottom view + section through port | 1:1 | Oval major/minor axes, forward-tilt chamfer, optional binding | Stage 6 cut. |
| 12 | Stand assembly | Front + side + plan | 1:2 | Upright curve, base, kanawa-tsugi key positions | Walnut stand. |
| 13 | Stand kanawa-tsugi detail | Exploded section | 2:1 | Key dimensions, mating angles, fit clearance | Construction technique callout. |
| 14 | Tuner detail with bulb cap and cord wrap | Section through tuner + cap | 2:1 | Tuner housing, output shaft, cap inner bore, cord-wrap position | Combines hidden modern tuner with visible Sumerian fingerprint. |
| 15 | Stern eyebolt + backing plate (SAM-19 / 25 / AE) | Section + exploded | 1:1 | Eyebolt, backing plate, glue line | Per R-S-05 spec; pull-test rated. |
| 16 | Heifer Zephyr brand inlay — Option A | Soundboard plan callout + detail | 2:1 | Wordmark dimensions, position stern-of-strip, brass-leaf inlay technique | Final selection deferred to brand-integration gate. |
| 17 | Heifer Zephyr brand inlay — Option B | Stand-base plan callout + detail | 2:1 | Wordmark on stand base, matching-lapis inlay | Alternative to Sheet 16. |
| 18 | Family overview comparison | All five variants at 1:5 | 1:5 | Side-by-side family scaling — SAM-13-ROOT, SAM-19-MID, SAM-25-CONCERT, SAM-13-AE, SAM-13-MULE | One sheet showing the parametric family. |

## Sheets — Per-variant overview

| Sheet | Title | Variant | Notes |
|---|---|---|---|
| 19 | SAM-19-MID overview | SAM-19-MID | Same three-view layout as Sheet 01–03 at family-spec scale. |
| 20 | SAM-25-CONCERT overview | SAM-25-CONCERT | Same three-view layout. |
| 21 | SAM-13-AE overview | SAM-13-AE | Adds piezo + jack callout in stern stub. |
| 22 | SAM-13-MULE overview | SAM-13-MULE | Identical to ROOT visually; annotated as test mule with reduced-tension string set. |

## Detail callouts to include on every overview sheet

- Total instrument height
- Body length / width / depth
- Number of strings
- Tuning range (G-major or A-major) for SAM-13 variants
- Total weight (planning estimate; update post-build)
- Material callout list (walnut / cedar / sapele / brass / lapis-look / MOP-or-composite)

## Datum conventions

Per the kora pattern:

- **DATUM A:** soundboard top face, at the stern centerline.
- **DATUM B:** body centerline (long axis), as seen in top plan.
- **DATUM C:** keel centerline, as seen in bottom plan.

All critical dimensions are referenced from one of these datums.

## Section views to include

- Hull cross-section at three stations (bow, midship, stern) on Sheet 06.
- Neck cross-section at three points along the arc on Sheet 07.
- Scarf joint section on Sheet 08.
- String-holder strip section on Sheet 09.
- Keel port section on Sheet 11.
- Tuner-cap-cord assembly section on Sheet 14.

## Drawing source-of-truth chain

1. `cad/SAM-000_master-equations.txt` — global equations (locked numeric source).
2. SolidWorks MasterLayout part — geometry built per `cad/SW-MIGRATION-CHECKLIST.md`.
3. SolidWorks design table — drives the 5 family configurations.
4. SVG drawings in `drawings/` — exported from SolidWorks + post-processed for title block, datums, and inlay callouts.
5. PDF print packet — collated drawings + body of packet documentation.

If a drawing's dimension disagrees with the master-equations file, the equations file wins.

## Drawing production plan for the capstone deck

Minimum set for the capstone:

- Sheet 01 (front elevation)
- Sheet 02 (side elevation, showing bow lift and keel port)
- Sheet 10 (soundboard inlay program — best visual fingerprint shot)
- Sheet 18 (family overview, showing parametric scaling)

If time is short, prioritize those four. The remaining sheets are for the print packet and the build-log site.

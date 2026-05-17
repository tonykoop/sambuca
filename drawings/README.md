# drawings/ — placeholder

This folder will hold the manufacturing-drawing SVG set per `drawing-brief.md`. SVGs are generated from the SolidWorks MasterLayout once the rebuild in `cad/SW-MIGRATION-CHECKLIST.md` completes.

## Files to produce (in order of capstone priority)

| File | Sheet # | Source | Priority for Fall 2026 capstone |
|---|---|---|---|
| `sambuca-overview-front.svg` | 01 | SW front elevation export | HIGH |
| `sambuca-overview-side.svg` | 02 | SW right elevation export | HIGH |
| `sambuca-overview-top.svg` | 03 | SW top plan export | HIGH |
| `sambuca-hull-side-profile.svg` | 04 | SW Right plane detail | medium |
| `sambuca-hull-top-profile.svg` | 05 | SW Top plane detail | medium |
| `sambuca-hull-cross-section.svg` | 06 | SW sections | medium |
| `sambuca-neck-arc.svg` | 07 | SW neck path + sections | medium |
| `sambuca-scarf-collar.svg` | 08 | SW joint detail | medium |
| `sambuca-string-holder-strip.svg` | 09 | SW strip + holes | medium |
| `sambuca-soundboard-inlay.svg` | 10 | SW soundboard + inlay | HIGH (for capstone "inlay program" slide) |
| `sambuca-keel-port.svg` | 11 | SW bottom + section | low |
| `sambuca-stand.svg` | 12 | SW stand assembly | low |
| `sambuca-stand-kanawa.svg` | 13 | SW joint detail | low |
| `sambuca-tuner-cap-wrap.svg` | 14 | SW tuner section | medium |
| `sambuca-stern-eyebolt.svg` | 15 | SW eyebolt + plate | low (variant-only) |
| `sambuca-brand-option-a.svg` | 16 | SW soundboard wordmark | gate-blocked |
| `sambuca-brand-option-b.svg` | 17 | SW stand wordmark | gate-blocked |
| `sambuca-family-overview.svg` | 18 | All 5 configs at 1:5 | HIGH (for capstone "family-spec" slide) |
| `sam-19-mid-overview.svg` | 19 | SW config: SAM-19-MID | medium |
| `sam-25-concert-overview.svg` | 20 | SW config: SAM-25-CONCERT | medium |
| `sam-13-ae-overview.svg` | 21 | SW config: SAM-13-AE | low |
| `sam-13-mule-overview.svg` | 22 | SW config: SAM-13-MULE | medium |

## Pre-CAD interim drawings (manual SVGs)

If SolidWorks rebuild slips, hand-draft these four SVGs from the master-equations dimensions for the capstone:

- `sambuca-overview-front.svg` — manually drafted from `body_length_mm`, `instrument_height_mm`, neck arc.
- `sambuca-overview-side.svg` — manually drafted from side profile + bow lift + keel port.
- `sambuca-soundboard-inlay.svg` — manually drafted soundboard plan with inlay band + bow panel.
- `sambuca-family-overview.svg` — five overlapping silhouettes at 1:5.

Don't draft the detail/section sheets manually — they need real CAD geometry.

## Conventions

All SVGs:

- Title block at lower-right: Project, Variant, Sheet, Scale, Units, Rev, Date, Author.
- Datums labeled per `drawing-brief.md` (DATUM A, B, C).
- Dimensions referenced to datums, not chained.
- Critical dimensions called out per `drawing-brief.md` table.
- Source comment in SVG header: `<!-- Generated from cad/SAM-000_master-equations.txt rev [X] -->`.

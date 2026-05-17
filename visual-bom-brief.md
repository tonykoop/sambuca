# Sambuca — Visual BOM Brief

Layout spec for the visual bill-of-materials plate. Pairs with `bom.csv` data; the visual BOM is the human-facing one-pager that goes into the capstone deck (one slide) and the print packet (one page).

## Document conventions

- **Format:** single-page printable. Default page size: letter or A4, landscape.
- **Headline:** "Sambuca — SAM-13-ROOT — Visual Bill of Materials"
- **Quote date:** ISO date at the top right.
- **Assembly hero image:** the full-instrument render at the top, occupying ~1/3 of the page.
- **Layout below:** grid of part rows, ~6 per page-column, two columns.
- **Cost flag:** "Planning estimates. Actual prices verified at purchase time." in 8 pt font at the bottom.

## Hero image spec

- **Subject:** SAM-13-ROOT, full instrument, three-quarter view from front-right.
- **Pose:** displayed on its CNC-curve-profiled walnut cradle stand.
- **Lighting:** soft directional light from upper-left.
- **Background:** neutral mid-gray, no distracting elements.
- **Resolution:** 2400 × 1600 px minimum, exportable to PDF at 300 dpi.
- **Source:** SolidWorks rendering OR finished-prototype photo (per `photo-shotlist.md`). Photo preferred for the final capstone deck.

## Part-row layout

Each row carries:

| Field | Notes |
|---|---|
| Thumbnail | ~80 × 80 px square, clean cutout against neutral background |
| Part name | e.g. "Hull — walnut, CNC-from-block" |
| Material spec | abbreviated, e.g. "Walnut FAS 8/4 quartersawn" |
| Quantity | per SAM-13-ROOT |
| Cost estimate | range, e.g. "$80–180" |
| Sourcing note | one-line, e.g. "Bell Forest Products / Owl Hardwood" |

## Visual BOM part list (SAM-13-ROOT)

Ordered by visual prominence:

1. **Hull** (walnut) — the boat body itself.
2. **Soundboard** (Western red cedar with multi-strip lapis band + bow inlay panel) — the top face the player faces.
3. **Neck** (sapele, laminated curve) — the cantilever rising forward.
4. **Brass neck-body collar** — the bright fingerprint element.
5. **13 tuners with gold-tone bulb caps and decorative wraps** — the row of pegs along the neck.
6. **Multi-strip lapis inlay band** — 5 parallel strips along the soundboard-hull seam.
7. **Bow-end inlay panel** — pale rectangular panel (mother-of-pearl or composite) at the bow.
8. **String-holder strip** — small walnut or maple strip on the soundboard near the bow.
9. **String set** (13 strings — 4 wound nylon basses + 9 fluorocarbon trebles).
10. **Stern stub feet** — two carved walnut blocks integral with the keel.
11. **Keel-port surround** (optional walnut binding around the oval port).
12. **Stand** (CNC-curve-profiled walnut cradle with kanawa-tsugi joinery).
13. **Heifer Zephyr brand inlay** (Option A soundboard or Option B stand — TBD per gate).

## Variant strip

Below the part list, a horizontal strip showing the five family variants side-by-side at consistent scale (1:5 or similar):

| Variant | Body length | Strings | Tuning | Harness |
|---|---|---|---|---|
| SAM-13-ROOT | 650 mm | 13 | G3 → E5 | none |
| SAM-19-MID | 850 mm | 19 | D3 → G5 | positioning belt |
| SAM-25-CONCERT | 1050 mm | 25 | A2 → A5 | sax harness |
| SAM-13-AE | 650 mm | 13 | G3 → E5 | none (+ piezo) |
| SAM-13-MULE | 650 mm | 13 | G3 → E5 (reduced T) | none |

## Cost summary line

Bottom of the page, single line:

> SAM-13-ROOT total planning estimate: $530–1300 USD. Major cost drivers: PVD-gold-tone bulb caps (~$60–260), geared tuners (~$40–180), walnut hull stock (~$80–180), bow-end inlay panel (~$15–60). See `bom.csv` for the line items.

## Color and typography

- **Brand-neutral while in private review** — no Heifer Zephyr wordmark on this page until the brand-integration gate closes.
- **Typography:** simple serif (e.g. Source Serif or Charter) for body, simple sans-serif (e.g. Inter or Source Sans) for callouts.
- **Color palette:** walnut brown, cedar honey, brass gold, lapis blue — pulled from the actual material colors. No saturated primaries.

## Production

When the SAM-13-ROOT is photographed for the final deck, run the visual BOM as:

1. Capture the hero image per `photo-shotlist.md` shot HERO-01.
2. Capture each visible part as a thumbnail (per `photo-shotlist.md` shots DETAIL-01 through DETAIL-13).
3. Composite in any vector tool (Affinity Designer, Adobe Illustrator, or Figma). Source files in `images/`; final PDF in `print-packet.pdf`.

## Variant visual BOMs

The SAM-19-MID, SAM-25-CONCERT, SAM-13-AE, and SAM-13-MULE share most of the SAM-13-ROOT BOM. Don't produce four separate visual BOMs — produce a single SAM-13-ROOT visual BOM and a one-page delta table for the other four variants.

# Sambuca — Photo Shot List

Captures for the capstone deck, print packet, build-log site, and the visual BOM. Organized by build stage so shots happen at the right moment, not retroactively from memory.

> **Cultural attribution rule:** every photo of BM 121198 or any cylinder-seal imagery is captioned with the catalog source and the rights line. Tony's own build photos are captioned with date and stage. See `risks.md` R-C-03.

## Equipment baseline

- Camera: at least 24 MP with manual control. iPhone 14+ acceptable for build-log; DSLR/mirrorless preferred for hero shots.
- Lighting: two soft-boxes minimum, ideally with a back-rim light for the brass-and-gold elements.
- Background: neutral mid-gray seamless paper for hero shots; shop bench OK for build-log.
- Color reference: shoot one frame with a Macbeth ColorChecker or X-Rite Passport in frame at the start of each session.

## Build-log shots (one per stage minimum)

| ID | Shot | Stage | Notes |
|---|---|---|---|
| BL-00 | Pre-build wood stack | Stage 0 | Walnut billet, cedar soundboard, sapele laminates side-by-side. Establishes the wood pairing. |
| BL-01 | Hull rough-cut (after CNC Path A) OR stave glue-up (after Path B) | Stage 1 | Shows hull-option choice. |
| BL-02 | Stub feet glued, hull empty | Stage 1 close | Shows stern stub blocks. |
| BL-03 | Neck laminating jig with three sapele strips clamped | Stage 2 | The curve-form shot. |
| BL-04 | Neck after CNC sweep, scarf cut visible | Stage 2 | Detail of the scarf cut. |
| BL-05 | Soundboard pre-inlay (cedar, dimensioned, braced) | Stage 3 | Plain cedar before any inlay work. |
| BL-06 | Soundboard with multi-strip lapis pocket cut (CNC) | Stage 3 close | Five parallel strips visible as empty pockets. |
| BL-07 | Soundboard with bow-end inlay panel pocket | Stage 3 close | Rectangular pocket at the bow. |
| BL-08 | Scarf joint dry-fit with brass collar dry-fit | Stage 4 | Pre-glue, showing alignment. |
| BL-09 | Scarf-and-collar assembly clamped | Stage 4 | Glue-up with collar in place. |
| BL-10 | Soundboard glued into hull, inlay band installation | Stage 5 | The lapis going in. |
| BL-11 | Inlay band scraped flush | Stage 5 | Finished band detail. |
| BL-12 | Keel port cut, viewed from inside hull | Stage 6 | Shows the forward-tilt chamfer. |
| BL-13 | Stand kanawa-tsugi dry-fit | Stage 7 | Joinery detail. |
| BL-14 | Tuners installed, caps and wraps in place | Stage 8 | The fingerprint visual. |
| BL-15 | MULE strung at reduced tension, in dial-indicator jig | Stage 10 | The 30-day hold setup. |
| BL-16 | Dial indicator reading at day 0 and day 30 | Stage 10 | Side-by-side comparison shots. |
| BL-17 | SAM-13-ROOT fully strung at calibrated tension | Stage 10 | First full-tension shot. |
| BL-18 | Sweep frequency response measurement setup | Stage 11 | DAW + reference mic at keel port. |

## Hero shots (capstone + visual BOM)

| ID | Shot | Notes |
|---|---|---|
| HERO-01 | SAM-13-ROOT three-quarter from front-right, on stand, soft directional light | The primary capstone hero image. Visual BOM hero. |
| HERO-02 | SAM-13-ROOT front elevation | Pure technical-front view. For the deck cover or print packet cover. |
| HERO-03 | SAM-13-ROOT side elevation (right) | Shows the bow lift and keel-port from the side. |
| HERO-04 | SAM-13-ROOT in playing position (player seated, instrument between thighs, neck rising forward) | Documents the symmetric forward-facing posture. Player face partially out of frame OK. |
| HERO-05 | Family lineup — all five variants side-by-side at consistent distance | If SAM-19/25/AE/MULE exist by capstone time. Otherwise SAM-13-ROOT + MULE pair shot. |

## Detail shots (visual BOM + drawing references)

| ID | Shot | Notes |
|---|---|---|
| DETAIL-01 | Walnut hull, close-up of grain on the bow lift | Material identity. |
| DETAIL-02 | Cedar soundboard, raking light to show texture | Material identity. |
| DETAIL-03 | Sapele neck, showing laminate lines and CNC sweep | Material + technique. |
| DETAIL-04 | Brass collar at scarf joint, polished or aged finish | Choose polished vs aged per R-F-02. |
| DETAIL-05 | Single tuner — bulb cap + cord wrap + base of shaft | The fingerprint element. |
| DETAIL-06 | Row of all 13 tuners along the neck | Pattern shot. |
| DETAIL-07 | Multi-strip lapis band, close-up | 5 strips + spacers visible. |
| DETAIL-08 | Bow-end inlay panel, close-up | MOP or composite, depending on R-X-02 pick. |
| DETAIL-09 | String-holder strip with tie-through holes | Shows the strip after voicing. |
| DETAIL-10 | Keel port from below | Oval port with forward tilt and (optional) binding. |
| DETAIL-11 | Stern stub feet from below | Confirms the two integral feet. |
| DETAIL-12 | Stand kanawa-tsugi joint, finished | Japanese joinery detail. |
| DETAIL-13 | Heifer Zephyr brand inlay (Option A or B per gate) | Brand element. |

## Build-log site shots (timeline)

The build-log site `site/index.html` pulls a chronological set:

- BL-00 → BL-18 in order.
- Plus a few HERO and DETAIL shots interspersed at the right stages.

Each image gets:

- ISO date in EXIF or filename.
- Stage tag (Stage 1, Stage 2, …).
- One-line caption.
- Alt text describing the image for accessibility.

## Capstone-deck shots (selection)

The deck uses a tight subset:

- HERO-02 (cover)
- HERO-04 (playing-position slide)
- DETAIL-04 (collar) + DETAIL-05 (tuner) on the "fingerprint preservation" slide
- DETAIL-07 (lapis band) + DETAIL-08 (bow panel) on the "inlay program" slide
- BL-15 + BL-17 on the "MULE-to-ROOT validation" slide
- HERO-05 (family lineup) on the "family-spec" slide
- BL-18 (acoustic measurement setup) on the "acoustic study" slide

## Cultural-attribution reference shots

For BM 121198 references in the deck and build-log:

- The BM 121198 display card photo from Don Hitchcock (CC BY-NC-SA 4.0 — credit required).
- The Herbology Manchester profile photo (used with permission per Tony's direct upload).
- The Penn Museum cylinder-seal B16728 photo (courtesy Penn Museum, University of Pennsylvania).
- The second photo set (Tony's direct uploads, 2026-05-16) — internal source, no external attribution needed.

Every appearance of these images carries:

- Caption with source.
- Copyright/rights line in the page footer or near the caption.

## Photo-pipeline integration

Once shots are captured, drop them in `images/` with naming convention:

```
images/<stage>-<id>-<short-slug>.jpg
images/<stage>-<id>-<short-slug>.txt   <- one-line caption + alt text
```

The build-log site generator (`scripts/generate_site.py` from instrument-maker-v4) picks them up automatically and renders them in the timeline.

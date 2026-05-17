# Sambuca — Supplier RFQ Drafts

Pre-drafted request-for-quote templates for the major supply categories. Edit the contact block at top of each draft with the actual supplier address before sending. All quantities are planning-estimates per `bom.csv`; verify against the active build before ordering.

> **Pricing assumption:** all RFQs request *current* quotes. Prices in this packet are planning-estimates only.

---

## RFQ-1 — Wood stock (walnut hull, cedar soundboard, sapele neck)

**To:** [supplier — Bell Forest Products, Owl Hardwood, LMI, or equivalent]
**Subject:** Quote request — small luthier-grade hardwood order, sambuca harp build
**Date:** [build start date]

I'm requesting a quote for the following hardwood stock for a small custom musical-instrument build. Quantities are sufficient for one SAM-13-ROOT prototype with allowance for one MULE test build (so ~2x for the hull and neck material).

| Item | Spec | Qty | Notes |
|---|---|---|---|
| Walnut, FAS or QSWO, 8/4 | Kiln-dried, dimensions allowing a 700 × 200 × 200 mm billet OR ten 60 × 20 × 700 mm staves | 2x set | Hull, stand uprights, stand base, stern stub feet. Want clean grain on the visible hull faces — please flag any staining or knots in the billet. |
| Walnut, FAS, 12/4 | Kiln-dried, ~300 × 150 × 80 mm | 1 | Stand base. |
| Western red cedar, AAA quartersawn, 3 mm | Soundboard quality, 200 × 700 mm, edge-glued or single panel | 2 (one 3.0 mm, one 2.5 mm) | Soundboard. Order both thicknesses for Wolfram sweep validation. |
| Sapele, FAS quartersawn, 8/4 | Rip-friendly to 12 mm laminate strips, ~800 mm long, ~50 mm wide | 1 set sufficient for three 12 mm laminates | Neck cantilever (laminated bend). |
| Cherry, air-dried, 6 mm sticks | Brace stock, ~200 mm long, ~12 × 12 mm | 4 | Internal hull braces fore and aft of keel port. |
| Holly or maple veneer, 0.8 mm | Inlay spacer | Sufficient for ~3 m of band perimeter (4 spacer rows) | Lapis-band parallel spacers. |

Please send: (a) current per-piece pricing or per-board-foot pricing, (b) lead time, (c) any photos of grain on the walnut billet, (d) shipping estimate to [Tony's address].

---

## RFQ-2 — Brass and stainless hardware

**To:** [McMaster-Carr or Online Metals]
**Subject:** Quote request — small custom brass collar + stainless dowels

| Item | Spec | Qty |
|---|---|---|
| Brass tube, 60 mm tall, ~50–60 mm OD, ~1 mm wall | C36000 or C26000, suitable for chemical patination | 2 (1 for SAM-13-ROOT, 1 for MULE / sample) |
| Stainless 304 dowel pin, 6 mm × 80 mm | For hidden scarf-joint pin | 5 (spares) |
| Stainless 304 forged eyebolt, M6 × 40 mm | For SAM-19 / 25 / AE harness mount | 3 |
| Brass rod, ~20 mm diameter, ~200 mm long | Custom-machined bulb caps (or buy pre-made — see RFQ-4) | 1 |

---

## RFQ-3 — String sets (G-major build + A-major retune)

**To:** [LMI Music or Strings Etc. or Lo-tech harp NZ]
**Subject:** Quote request — custom calibrated string set, 13-string boat-harp

I'm building a 13-string arched harp with the following parameters:

- Speaking length range: ~580 mm (bass) → ~200 mm (treble), curve exponent k=0.85.
- Target total tension: 65–80 kgf across all 13 strings.
- Soundboard: 3 mm Western red cedar with light fan bracing.
- String spacing on the holder strip: ~6 mm.

I need two string sets:

### Set A — G-major build target (G3 → E5)

| String # | Pitch | Speaking length | Type |
|---|---|---|---|
| 1 | G3 (196.0 Hz) | ~580 mm | Wound nylon (low-tension bass) |
| 2 | A3 (220.0 Hz) | ~530 mm | Wound nylon |
| 3 | B3 (246.9 Hz) | ~485 mm | Wound nylon |
| 4 | C4 (261.6 Hz) | ~462 mm | Wound nylon |
| 5 | D4 (293.7 Hz) | ~420 mm | Fluorocarbon |
| 6 | E4 (329.6 Hz) | ~378 mm | Fluorocarbon |
| 7 | F#4 (370.0 Hz) | ~340 mm | Fluorocarbon |
| 8 | G4 (392.0 Hz) | ~322 mm | Fluorocarbon |
| 9 | A4 (440.0 Hz) | ~290 mm | Fluorocarbon |
| 10 | B4 (493.9 Hz) | ~262 mm | Fluorocarbon |
| 11 | C5 (523.3 Hz) | ~248 mm | Fluorocarbon |
| 12 | D5 (587.3 Hz) | ~222 mm | Fluorocarbon |
| 13 | E5 (659.3 Hz) | ~200 mm | Fluorocarbon |

Please propose specific gauges. Targeting 5–7 kgf per string for the calibrated total.

### Set B — A-major drop-in retune (A3 → F#5)

Same instrument, retuned a whole step up. Same speaking lengths. Targeting 5.5–7.5 kgf per string. Both wound nylon basses and fluorocarbon trebles, gauges adjusted upward to compensate for the higher pitches at unchanged length.

| String # | Pitch | Type |
|---|---|---|
| 1 | A3 (220.0 Hz) | Wound nylon |
| 2 | B3 (246.9 Hz) | Wound nylon |
| 3 | C#4 (277.2 Hz) | Wound nylon |
| 4 | D4 (293.7 Hz) | Wound nylon |
| 5 | E4 (329.6 Hz) | Fluorocarbon |
| 6 | F#4 (370.0 Hz) | Fluorocarbon |
| 7 | G#4 (415.3 Hz) | Fluorocarbon |
| 8 | A4 (440.0 Hz) | Fluorocarbon |
| 9 | B4 (493.9 Hz) | Fluorocarbon |
| 10 | C#5 (554.4 Hz) | Fluorocarbon |
| 11 | D5 (587.3 Hz) | Fluorocarbon |
| 12 | E5 (659.3 Hz) | Fluorocarbon |
| 13 | F#5 (740.0 Hz) | Fluorocarbon |

### Set C — SAM-13-MULE reduced-tension test set

Same instrument, full G-major tuning, but at half-tension. Targeting 3.0–4.5 kgf per string. Same speaking lengths. Lighter gauges across the board. Used for the 30-day joint-validation hold per `validation.csv` V-S-01. Disposable.

---

## RFQ-4 — Geared guitar tuners + PVD-gold-tone bulb caps

**To:** [Stewart-MacDonald / Allied Lutherie / local CNC shop + PVD finisher]
**Subject:** Quote request — small-format geared tuners with custom decorative caps

### Tuners

I need 13 compact-housing geared tuners (small-format classical guitar or harp style). Critical dimensions:

- Maximum housing depth behind the post: 50 mm
- Output shaft diameter: 6–8 mm
- Mounting: through-hole into wood, locked from the back by a flange or screw

If you have a model that fits inside a 50 mm-deep neck cross-section, please confirm with a CAD drawing or photo.

### PVD-gold-tone bulb caps

I need 13 custom caps that slip over the tuner output shaft and present as decorative gold bulbs. Spec:

- Outer profile: roughly spherical or oblate-spheroid, ~16–18 mm diameter, ~12–14 mm tall
- Bore: clearance-fit over the geared-tuner output shaft (6–8 mm depending on tuner choice)
- Material: brass C36000 or C26000, machined or 3D-printed (cast or sintered acceptable)
- Finish: PVD gold-tone (titanium nitride OR zirconium nitride OR true gold-color PVD)

Please quote either:

1. **Custom-machined + PVD path** — turn 13 caps from brass rod, send to PVD finisher. Quote both stages.
2. **Stock part adapt** — propose a jewelry/clock-parts catalog item that meets the spec at lower cost.

The caps are the most visible decorative element on the instrument. Color match across 13 caps is critical.

---

## RFQ-5 — Inlay materials (multi-strip lapis band + bow-end panel)

**To:** [Certainly Wood / Stewart-MacDonald / Maples Inlays]
**Subject:** Quote request — luthier inlay stock for a boat-harp build

### Multi-strip lapis band

5 parallel strips per band, ~3 m total band perimeter.

| Item | Spec | Qty |
|---|---|---|
| Dyed-blue veneer | "Lapis-blue" or "deep blue" dye, 1.5 mm thick, 15+ mm wide | Sufficient for 5 strips × 3 m = 15 linear meters |
| Holly or maple spacer veneer | Natural light color, 0.8 mm thick | 4 strips × 3 m = 12 linear meters |

Color match across the 5 strips is critical; please confirm dye lot is single batch.

### Bow-end soundboard inlay panel

| Item | Spec | Qty |
|---|---|---|
| Mother-of-pearl OR shell composite OR pale-stone composite | 100 × 60 × 1.5 mm tile, pale color | 1 (sample set of 3 candidates preferred — see notes) |

For the panel, I would prefer to receive **one sample of each of three candidate materials** (true MOP, abalone-look composite, pale-stone-look composite) so I can finish-test on a scrap soundboard before committing to the final material. Quote the sample set separately from the production tile.

### Heifer Zephyr brand inlay stock (TBD per brand-integration gate)

Either:

- **Option A (soundboard):** brass-leaf veneer for italic-serif wordmark, ~80 × 14 × 0.3 mm.
- **Option B (stand):** matching lapis-blue dyed veneer (~120 × 18 × 1.5 mm).

Quote both; we'll pick after the brand-integration review closes.

---

## RFQ-6 — Harness hardware (SAM-19 / SAM-25)

**To:** [REI / Petzl / BG Music / Sweetwater / marine chandlery]
**Subject:** Quote request — sax-style + work-positioning harnesses for harp builds

### For SAM-19-MID

| Item | Spec | Qty |
|---|---|---|
| Padded work-positioning belt, 50–75 mm wide, with side D-rings | Climbing / arborist style, hook-and-loop + steel buckle closure | 1 |
| Adjustable nylon tether strap, ~600 mm, with cam buckle | 1 in nylon webbing | 1 |
| Locking carabiner / locking snap hook | 40 kN rated; locking, not snap-only | 1 |

### For SAM-25-CONCERT

| Item | Spec | Qty |
|---|---|---|
| Saxophone-style shoulder harness, padded yoke + sternum strap, hook | BG S40SH, Neotech Soft Sax, or Cebulla — please quote your closest equivalent | 1 |
| Locking carabiner / locking snap hook | 40 kN rated; locking | 1 |

The locking-hook requirement is non-negotiable per safety risk R-Z-02. Please confirm the hook is *locking*, not just *snap-only*.

---

## RFQ-7 — Acoustic-electric components (SAM-13-AE only)

**To:** [K&K Sound / Stewart-MacDonald / Sweetwater]
**Subject:** Quote request — under-strip piezo for boat-harp

| Item | Spec | Qty |
|---|---|---|
| Under-saddle / under-strip piezo transducer, K&K Pure Mini or equivalent | Suitable for ~120 mm long string-holder strip | 1 |
| 1/4 in barrel jack, panel-mount, gold or chrome | Hidden in stern stub, accessible from outside | 1 |
| Internal wiring kit, 22 AWG stranded, ~1 m + heatshrink | Includes solder and basic shielding | 1 |

Please confirm the piezo transducer can be glued in-line under a glued-on hardwood string-holder strip (not a slotted bridge).

---

## Common notes for all RFQs

- Pricing is requested as a **planning estimate** only. We will issue purchase orders separately after the cultural-review and validation gates clear.
- Lead times in `sourcing.csv` are typical-industry estimates, not committed. Please respond with your actual lead time so the build schedule can adjust.
- All deliveries to: **[Tony's address]**.
- Contact: Tony Koop — [tonykoop@gmail.com] or via the Heifer Zephyr workshop.

# Sambuca — Shop Packet (Print Edition)

**Build target:** SAM-13-ROOT — 650 mm boat-shaped arched harp, 13 strings, G-major.
**Status:** private review (pending three release gates).
**Packet version:** instrument-maker-v4, generated 2026-05-16.

> This is the printable shop packet. Take it to the bench. Cross-reference back to the live files in the repo when in doubt.

---

## File map (one-page reference)

| File | Purpose | Take to bench? |
|---|---|---|
| `design.md` | Design intent, fingerprint, soundhole strategy, cultural provenance | reference only |
| `reverse-engineering.md` | Source-material analysis | reference only |
| `family-spec.csv` | 5-variant table | reference only |
| `risks.md` | Red-team risk register with verification tests | check before each stage |
| `bom.csv` | Make/buy materials and hardware | yes — ordering |
| `sourcing.csv` | Candidate suppliers, planning prices | yes — ordering |
| `cut-list.csv` | Rough and final dimensions for every cut | **yes — bench** |
| `validation.csv` | Dimensional, tension, acoustic, joint, safety, cultural checks | **yes — bench** |
| `assembly-manual.md` | 12-stage build sequence with hold points | **yes — bench** |
| `supplier-rfq.md` | RFQ drafts to send out | yes — ordering |
| `drawing-brief.md` | Drawing-package spec | reference only |
| `cad/SAM-000_master-equations.txt` | Global equations (source of truth) | reference only |
| `cnc/cnc-plan.md` | Pre-CAM operation plan per part | **yes — bench** |
| `wolfram/sambuca-acoustics-starter.wl` | Acoustic study notebook | reference only |
| `photo-shotlist.md` | Capture list across the build | each stage |
| `harness/README.md` | SAM-19 + SAM-25 harness design | only for those variants |
| `capstone-deck.pptx` | Capstone presentation | not in shop |
| `site/index.html` | Build-log site (private until release) | not in shop |

---

## Design intent (one paragraph)

Modern parametric family-scalable boat-shaped arched harp that preserves the Sumerian visual fingerprint (gold-flared cap, 13 bulb pegs with cord wraps, J-curve neck, multi-strip lapis band, brass collar, bow-end inlay panel, two stern stub feet) while delivering modern playability (geared tuners hidden behind decorative caps, calibrated fluorocarbon + wound-nylon string set at 65–80 kgf, keel-port soundhole projecting forward toward the listener, CNC-machined hull/neck/inlay, kanawa-tsugi stand). Build target SAM-13-ROOT; four siblings (SAM-19-MID, SAM-25-CONCERT, SAM-13-AE, SAM-13-MULE) derive from the same MasterLayout via `body_length_mm` and `string_count`.

## Cultural provenance — for the public-release language

Inspired by the Sumerian boat-shaped arched harp from BM 121198 (Royal Cemetery at Ur, c. 2600 BC, ~4500 years old, public domain). Not a reproduction, not a recreation of any specific surviving artifact, not a claim of cultural authority over any modern living tradition. The Hellenistic Greek *sambykē* (σαμβύκη) etymological link is historically contested; the build uses the term while acknowledging the uncertainty.

---

## Family-spec summary

| ID | Body length | Strings | Tuning | Total tension | Harness |
|---|---|---|---|---|---|
| **SAM-13-ROOT** | 650 mm | 13 | G3 → E5 | 65–80 kgf | none |
| SAM-19-MID | 850 mm | 19 | D3 → G5 | ~100 kgf est. | low-back belt |
| SAM-25-CONCERT | 1050 mm | 25 | A2 → A5 | ~120 kgf est. | sax harness |
| SAM-13-AE | 650 mm | 13 | G3 → E5 | 65–80 kgf | none + piezo |
| SAM-13-MULE | 650 mm | 13 | G3 → E5 (reduced T) | 40–50 kgf | none |

---

## Wood pairing (locked)

| Component | Species |
|---|---|
| Hull (and stand) | Walnut — FAS quartersawn 8/4 |
| Soundboard | Western red cedar — quartersawn AAA 3 mm (Wolfram-sweep 2.5–4.0) |
| Neck | Sapele — three 12 mm laminates around a curved form |
| String-holder strip | Walnut or hard maple |
| Bracing | Cedar (matches soundboard movement) |

---

## BOM summary (SAM-13-ROOT)

See full `bom.csv` for all 44 lines and per-variant deltas. Headline cost: planning estimate **$530–1300 USD** for SAM-13-ROOT, prices not live-verified.

Highest-risk supply items:

- **BOM-018** PVD-gold-tone brass bulb caps (13) — custom part, longest lead. Parallel two-shop search.
- **BOM-017** Geared guitar tuners (13) — mock-fit one sample before bulk order to verify `neck_depth_mm` clearance.
- **BOM-007** Bow-end inlay panel (mother-of-pearl or composite) — three-candidate sample compare before commit.

## Sourcing summary

Spec-first table in `sourcing.csv`. Three candidate suppliers per line. **No live prices verified — confirm before ordering.**

Order in this sequence to fit the 6–10 week build:

1. Week 1: PVD bulb caps (3–5 week lead) + walnut hull stock (2–4 weeks).
2. Week 2: sapele neck stock, cedar soundboard, tuners (mock-fit first).
3. Week 3: brass collar tube, eyebolts, string sets (after Wolfram sweep).
4. Week 4: inlay materials.

---

## Cut-list (build-target subset)

Full table in `cut-list.csv`. Highlights:

| Cut ID | Part | Final dims | Material | Notes |
|---|---|---|---|---|
| CUT-001a or CUT-001b | Hull | 650 × 150 × 150 mm, wall 6 mm | Walnut | A: CNC-from-block. B: stave-laminated. Pick one. |
| CUT-009 + CUT-011 | Neck blank | ~810 mm arc, 38 × 38–50 mm cross-section | Sapele 3-laminate | Glue → cure 48 hr → CNC sweep |
| CUT-005 | Soundboard | 650 × 150 × 3 mm | Cedar QSAAA | Final after sanding |
| CUT-007 | String-holder strip | 120 × 10 × 4 mm | Walnut or maple | Glued **after voicing** on MULE |
| CUT-018 | Keel port | 80 × 50 mm oval, 15° forward tilt | (cut from hull) | Stage 6 |
| CUT-014 | Brass collar | 60 mm tall, ~1 mm wall | Brass tube | Aged or polished per R-F-02 |
| CUT-023 | Multi-strip lapis inlay pocket | 5 × 1.5 mm strips + 4 × 0.8 mm spacers | (route in soundboard) | 0.8 mm end mill |
| CUT-026 | Bow-end inlay panel pocket | 100 × 60 × 1.5 mm | (route in soundboard) | Per `bow_panel_x_from_stern_mm` |

---

## Drawing brief callout

Minimum drawings required for the Fall 2026 capstone (see `drawing-brief.md` for the full 22-sheet list):

- Sheet 01 — Overview front
- Sheet 02 — Overview side (shows bow lift + keel port)
- Sheet 10 — Soundboard inlay program
- Sheet 18 — Family overview

Source of truth: `cad/SAM-000_master-equations.txt`. SVGs are generated from SolidWorks once the rebuild per `cad/SW-MIGRATION-CHECKLIST.md` clears.

---

## Assembly stages (one-line summary each)

| # | Stage | Hold? | Critical risk |
|---|---|---|---|
| 0 | Pre-build (sourcing, fixtures, tuner mock-fit) | yes — R-X-04 mock-fit before cutting stock | — |
| 1 | Hull (Path A or Path B) | yes — wall thickness verified | R-S-04 |
| 2 | Neck blank (laminate + CNC sweep) | yes — scarf cut clean | R-S-01 |
| 3 | Soundboard (3 mm cedar, fan brace, inlay pockets cut not filled) | yes | R-F-01 |
| 4 | Hull seam scarf + brass collar | **yes — V-J-01 at 24h and 48h** | R-S-01 |
| 5 | Soundboard installation + inlay filling | yes | — |
| 6 | Keel port cut | yes — V-S-03 decision | R-S-03 |
| 7 | Stand (CNC-curve + kanawa-tsugi) | parallel | — |
| 8 | Tuners + cord wraps + bulb caps | yes — fingerprint complete | — |
| 9 | String-holder strip + prototype voicing on MULE | **yes — V-A-05 voicing decision** | R-A-01 |
| 10 | MULE 30-day hold + ROOT gradual stringing | **GATE — V-S-01 + V-T-02** | R-S-01 + R-S-04 |
| 11 | Final voicing + acoustic measurement | yes — V-A-01 | R-A-01 |
| 12 | Documentation + brand integration | yes — V-C-01 + V-B-01 | R-C-01 |

> Full manual at `assembly-manual.md`. Read it before starting.

---

## Validation / tuning sheet (printable)

Full table in `validation.csv`. Bench-side highlights:

### Dimensional checks (V-D-01 through V-D-14)

- [ ] Body length 650 ± 2 mm
- [ ] Body width 150 ± 2 mm
- [ ] Body depth 140–170 mm
- [ ] Instrument height 810 ± 5 mm
- [ ] Hull-wall thickness 6 ± 0.5 mm at midship, bow, stern
- [ ] Neck arc 710 ± 5 mm
- [ ] Brass collar 60 ± 1 mm
- [ ] String-holder strip 120 × 10 × 4 mm
- [ ] Tie-through holes 13, ±0.3 mm spacing, Φ1.5 mm
- [ ] Multi-strip lapis band 11–13 mm total width
- [ ] Bow-end inlay panel 100 × 60 × 1.5 mm pocket
- [ ] Keel port 80 × 50 mm, 12–18° forward tilt

### Structural checks (V-S-01 through V-S-05)

- [ ] SAM-13-MULE 30-day neck-deflection ≤ 2 mm at gold cap
- [ ] Brass collar gap monitor ≤ 0.3 mm over a season
- [ ] Soundboard pull-test holds 2× service load
- [ ] Stern eyebolt holds 30 kgf for 60 s (SAM-19/25/AE only)
- [ ] Keel-port keel deflection ≤ 1.5× unported case

### Tension checks (V-T-01 through V-T-04)

- [ ] MULE total 40–50 kgf
- [ ] ROOT total 65–80 kgf (calibrated)
- [ ] ROOT 30-day tension drift < 10%

### Acoustic checks (V-A-01 through V-A-05)

- [ ] SPL at 1 m within ±6 dB of Wolfram prediction
- [ ] Coupled cavity-plate pair signature (two peaks split 30–80 Hz)
- [ ] Tuning drift < ±10 cents per string at 24 hr
- [ ] Keel-port Helmholtz 128–158 Hz
- [ ] String-holder strip position locked after voicing

### Cultural + brand gates (V-C-01 through V-B-02)

- [ ] Cultural-advisor sign-off on provenance language
- [ ] Every BM 121198 and cylinder-seal image credited
- [ ] Heifer Zephyr placement option locked

---

## Supplier-RFQ summary

Send these RFQs in week 1. Full drafts in `supplier-rfq.md`.

| RFQ | To | Items |
|---|---|---|
| RFQ-1 | Wood supplier | Walnut hull stock, walnut 12/4 base, cedar soundboard (2.5 + 3.0 mm), sapele neck stock, cherry brace stock, holly/maple spacer veneer |
| RFQ-2 | Brass/stainless supplier | Brass tube for collar (×2 for spare), stainless dowel pins, stainless eyebolts, brass rod for cap turning |
| RFQ-3 | String supplier | Set A (G-major calibrated, 13 strings), Set B (A-major drop-in), Set C (MULE reduced tension) |
| RFQ-4 | Tuner supplier + PVD finisher | 13 compact-housing geared tuners + 13 PVD-gold-tone bulb caps (custom-machined or sourced) |
| RFQ-5 | Inlay supplier | Dyed-blue veneer (5 strips × 3 m), holly/maple spacer, MOP/shell composite panel (3 samples for compare), brand inlay stock |
| RFQ-6 | Harness supplier | Low-back belt + locking hook (SAM-19), sax harness + locking hook (SAM-25) |
| RFQ-7 | Electronics supplier | Under-strip piezo + 1/4" jack + wiring (SAM-13-AE only) |

---

## Visual BOM brief

One-page visual BOM lives in `visual-bom-brief.md` plus the rendered visual (placeholder until the photo set is captured). Print last, when the SAM-13-ROOT is finished and photographed.

---

## Appendix — risks worth a second look before each stage

- **R-S-01 Neck cantilever failure** — *the* single highest risk. Hold the MULE for the full 30 days before stringing the ROOT.
- **R-S-04 Soundboard collapse** — pull-test the string-holder-strip glue line on scrap cedar before mounting the production strip.
- **R-S-05 Eyebolt pull-through** — only matters for SAM-19/25/AE, but it's a safety gate when it does.
- **R-A-01 Quiet voice on SAM-13-ROOT** — the small 3.8 L cavity is the chronic concern. Wolfram-sweep before committing soundboard thickness; iterate on MULE.
- **R-C-01 Cultural-advisor review** — public-release gate. Submit the provenance language early; don't wait until Stage 12.
- **R-X-03 PVD bulb caps** — longest-lead supply item. Order in week 1.

---

## Public-release gate checklist (final page)

- [ ] V-S-01 SAM-13-MULE neck-deflection 30-day hold passed
- [ ] V-T-02 SAM-13-ROOT calibrated-tension target hit (65–80 kgf)
- [ ] V-C-01 Cultural-provenance advisor review signed off
- [ ] V-B-01 Heifer Zephyr placement option locked (A soundboard or B stand)
- [ ] R-S-05 SAM-25 eyebolt pull-test passed (if SAM-25 in release scope)
- [ ] All `validation.csv` cultural-category rows closed (V-C-01, V-C-02, V-C-03)
- [ ] `site/index.html` private-review banner removed
- [ ] `README.md` updated to public-release language
- [ ] License files in place (CERN-OHL-W-2.0 for design, CC-BY-4.0 for content)

---

*Tony Koop · Heifer Zephyr · Sambuca SAM-13-ROOT · Fall 2026 capstone · private review*

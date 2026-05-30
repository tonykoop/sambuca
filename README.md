# Sambuca

A modern boat-shaped arched harp inspired by the Royal Cemetery of Ur, c. 2600 BC.

> "More accurately described as a boat-shaped harp" — British Museum curator's card, object 121198.

**Status:** private review. Build packet complete (`instrument-maker-v4` skill, 2026-05-16). Three release gates open before public release.

---

## What this is

The sambuca is Tony Koop's reinterpretation of the Sumerian boat-shaped arched harp recovered from the Royal Tombs at Ur. The original artifact (British Museum object 121198) survives only as gold tuning pegs, lapis lazuli decorative fragments, and Woolley's field sketches; the wood was reconstructed in 1971–72 from contemporary cylinder-seal depictions. That gives the modern build a 4500-year-old visual fingerprint — boat hull, curved cantilever neck, gold-flared cap, multi-strip lapis seam band, row of bulb tuning pegs with cord wraps, bow-end inlay panel, integral stern stub feet — and full design freedom on every dimension underneath.

This build modernizes the form with:

- CNC-routed walnut boat hull, raised depth (D/L = 0.31 for SAM-13, scaling to 0.40 for SAM-25 per chang reference) — parametric half-ellipsoid; stave-laminated alternative supported.
- Laminated-bend CNC-swept sapele neck.
- **Zither pegs (wood-bodied, steel hex tip)** for SAM-13 — switched 2026-05-16 from gold-bulb-capped geared tuners; matches chang-tradition look and pairs with new hull-side inlay program. Modern metal geared hardware remains a documented alternate.
- Western red cedar soundboard (~3 mm) with light fan bracing.
- Multi-strip lapis-look CNC inlay band along the soundboard-hull seam (5 parallel strips with light spacers).
- Rectangular pale inlay panel at the bow end of the soundboard (mother-of-pearl or shell composite).
- **Intricate longitudinal hull-side inlay** running ~70% of body length on both hull faces (added 2026-05-16) — cylinder-seal-style figural or Sumerian-rosette motifs, CNC-routed pockets backfilled with shell, contrasting wood, brass wire, or dyed epoxy.
- Brass collar over a glued scarf joint at the neck-body junction.
- **Slip-cast ornamental finial** at the top of the neck (porcelain or stoneware, glazed; natural placement for the Heifer Zephyr bison mark) — chosen 2026-05-16 over the BM-style flared gold cap.
- Single oval keel-port soundhole projecting forward toward the listener (not toward the player).
- Glued-on string-holder strip near the bow (standard arched-harp practice — no separate raised bridge bar).
- Fluorocarbon-treble + wound-nylon-bass string set, calibrated to 65–80 kgf total.
- Walnut CNC-curve-profiled cradle stand with kanawa-tsugi or mitsuke-aritsugi joinery.

## Family

Five planned variants, all from one MasterLayout part. See `family-spec.csv`.

| ID | Body length | Strings | Tuning | Harness | Role |
|---|---|---|---|---|---|
| **SAM-13-ROOT** | 650 mm | 13 | G3 → E5 | none | build target |
| SAM-19-MID | 850 mm | 19 | D3 → G5 | low-back belt | mid concert |
| SAM-25-CONCERT | 1050 mm | 25 | A2 → A5 | sax harness | concert |
| SAM-13-AE | 650 mm | 13 | G3 → E5 | none + piezo | acoustic-electric |
| SAM-13-MULE | 650 mm | 13 | G3 → E5 (reduced T) | none | tension test mule |

## Status

- ✅ Taxonomy locked (arched harp / sambuca, not lyre — confirmed by BM curator card).
- ✅ Anchor dimensions captured from BM 121198 display card and the second photo set.
- ✅ Reverse-engineering analysis complete (`reverse-engineering.md`).
- ✅ Design intent, family spec, soundhole strategy, harness design, inlay program documented (`design.md`).
- ✅ SolidWorks global equations file (`cad/SAM-000_master-equations.txt`).
- ✅ Wolfram acoustic study with soundboard plate-mode estimator and coupled cavity × plate response (`wolfram/sambuca-acoustics-starter.wl`).
- ✅ Full v4 build packet — BOM, sourcing, cut list, validation, assembly manual, supplier RFQs, drawing brief, visual BOM brief, photo shotlist, CNC operation plan, risks register, capstone deck, print packet, build-log site.
- ✅ Dual-license arrangement locked (CERN-OHL-W-2.0 for design files + CC-BY-4.0 for written content).
- 🟡 SolidWorks MasterLayout rebuild from kora Pack-and-Go — checklist in `cad/SW-MIGRATION-CHECKLIST.md`, manual SW UI work pending.
- 🟡 SVG drawings — generated from SolidWorks once the rebuild clears.
- 🟡 SAM-13-MULE build for tension and joint validation (release gate).
- 🟡 Cultural-advisor review of provenance language (release gate).
- 🟡 Heifer Zephyr brand integration option locked (release gate).
- 🟡 Learn-to-play starter songbook (paired with `sheet-music` skill, populates after MULE voicing).

## Packet map

### Design foundation

- `reverse-engineering.md` — analysis of BM 121198 and the second photo set. Read this first.
- `design.md` — design intent, soundhole strategy, harness logic, inlay program, cultural provenance language, brand options.
- `acoustic-validation-decision.md` — public/private-review decision record for acoustic validation tracking.
- `family-spec.csv` — five family variants.
- `risks.md` — red-team register with verification tests.

### Tables

- `bom.csv` — make/buy materials and hardware, per-variant.
- `sourcing.csv` — candidate suppliers, planning prices (not live-verified).
- `cut-list.csv` — rough and final dimensions for every cut, both hull options.
- `validation.csv` — dimensional, tension, acoustic, joint, safety, and cultural checks.

### Build process docs

- `assembly-manual.md` — 12-stage build sequence with MULE tension hold point.
- `supplier-rfq.md` — RFQ drafts for wood, brass, strings, tuners, inlay, harness, electronics.
- `drawing-brief.md` — 22-sheet manufacturing-drawing spec.
- `visual-bom-brief.md` — layout spec for the visual BOM one-pager.
- `photo-shotlist.md` — capture list across the build.

### Engineering

- `cad/SAM-000_master-equations.txt` — global equations (single source of truth).
- `cad/SW-MIGRATION-CHECKLIST.md` — SolidWorks rebuild plan.
- `cad/README.md` — operational notes.
- `cad/SAM-000_MasterLayout.SLDPRT`, `cad/SAM-000_SAMBUCA.SLDASM` — Pack-and-Go from kora (geometry pending rebuild).
- `cnc/cnc-plan.md` — pre-CAM operation plan per part.
- `wolfram/sambuca-acoustics-starter.wl` — acoustic study notebook with plate-mode + coupled-response extensions.
- `drawings/README.md` — drawing-package index (SVGs generated from SW after rebuild).
- `harness/README.md` — SAM-19 and SAM-25 harness designs.

### Capstone

- `capstone-deck.md` — slide outline.
- `capstone-deck.pptx` — 15-slide capstone presentation.
- `capstone-manifest.json` — artifact inventory.
- `print-packet.md` — shop packet source.
- `print-packet.html` — styled HTML version.
- `print-packet.pdf` — print-ready PDF.

### Public-facing

- `site/index.html` — build-log site (private-review banner until release).
- `learn-to-play/` — placeholder; populated by the `sheet-music` skill once MULE voicing locks the tuning.

### License

- `LICENSE` — top-level dual-license overview.
- `LICENSE-design.txt` — CERN-OHL-W-2.0 full text (governs design files).
- `LICENSE-content.txt` — CC-BY-4.0 full text (governs written content and media).

## How to use this repo

**If you want to build a sambuca:**
1. Read `print-packet.pdf` (or `print-packet.md`) — that's the shop-facing summary.
2. Open `assembly-manual.md` and `cnc/cnc-plan.md` at the bench.
3. Keep `cut-list.csv`, `validation.csv`, and `bom.csv` close.
4. Don't skip Stage 9 (string-holder strip voicing on the MULE) or Stage 10 (the 30-day tension hold).

**If you want to understand the design:**
1. `reverse-engineering.md` for the source material.
2. `design.md` for the modern design decisions.
3. `wolfram/sambuca-acoustics-starter.wl` for the acoustic study.
4. `cad/SAM-000_master-equations.txt` for the numeric source of truth.

**If you want to see the capstone presentation:**
1. `capstone-deck.pptx`.
2. Or browse `site/index.html` for the build-log version (private-review until release).

**If you want to adapt or extend:**
1. The MasterLayout is parametric — `body_length_mm` and `string_count` drive the five variants. Add a sixth by adding a row to `family-spec.csv` and a configuration in the SolidWorks design table.
2. The string-tuning is locked at G-major as the build target; A-major is documented as a drop-in retune in `supplier-rfq.md` Set B.

## Provenance & cultural notes

The sambuca pattern is rooted in early Mesopotamian (Sumerian) musical instruments from the Royal Cemetery at Ur, approximately 4500 years old. The pattern itself is unambiguously in the public domain — there is no living tradition with a claim on the form, no surviving lineage of practitioners, and the surviving artifact at the British Museum (object 121198) is itself a 1971–72 reconstruction of which only the gold tuning pegs and lapis lazuli decorations are original Sumerian material. The wood is interpretive.

The Greek term *sambykē* (σαμβύκη) is a later (Hellenistic) word, historically debated as a possible descendant of the Sumerian form. This build adopts "sambuca" as the modern repo and brand term while acknowledging that the Hellenistic *sambykē* may or may not be a direct descendant; it is not a claim of identity with the Greek instrument.

This build is **inspired by** the Sumerian pattern. It is **not**:

- A reproduction of any specific surviving artifact.
- A recreation of any reconstructed instrument such as BM 121198.
- A claim of cultural authority over any modern living tradition.
- A claim that the original sounded like this — we have no recordings of Sumerian music; tuning systems, voicing, and performance practice for the original are unknowable.

The full cultural-provenance language is in `design.md` (section "Cultural provenance language (locked for public release)") and is the subject of one of the three release gates.

## Related repos

- [`kora`](../kora) — multi-string harp template; parametric structure adapted here for sambuca.
- [`fujara`](../fujara) → [`moseno`](../moseno) — earlier SolidWorks MasterLayout precedent (Pack-and-Go variant pattern).
- [`instrument-showcase`](../instrument-showcase) — portfolio entry point.
- [`ashiko-drum-workshop`](../ashiko-drum-workshop) — workshop-content precedent (single-license CC-BY-4.0; the sambuca is dual-licensed because it includes serious hardware design).

## License

**Dual-license** by content type.

- **Design files** — `cad/`, `drawings/`, `cnc/`, `harness/`, `bom.csv`, `sourcing.csv`, `cut-list.csv`, `validation.csv`, `family-spec.csv`, `wolfram/*.wl` — are licensed under [**CERN Open Hardware Licence Version 2 – Weakly Reciprocal**](https://spdx.org/licenses/CERN-OHL-W-2.0.html) (SPDX: `CERN-OHL-W-2.0`). See `LICENSE-design.txt`.

- **Written content and media** — `*.md` files, `capstone-deck.pptx`, `capstone-manifest.json`, `print-packet.*`, `site/`, `images/`, `learn-to-play/` — are licensed under [**Creative Commons Attribution 4.0 International**](https://spdx.org/licenses/CC-BY-4.0.html) (SPDX: `CC-BY-4.0`). See `LICENSE-content.txt`.

- See `LICENSE` for the dual-license overview, attribution guidance, and third-party material credits.

Why dual-license: the design files want hardware-native legal shape with patent provisions and a weak share-back requirement; the documentation and media want permissive reuse with attribution. The CERN-OHL-W keeps the parametric design open under modification-and-redistribution scenarios but doesn't restrict anyone building a sambuca; CC-BY makes the writing and photos easy to quote, excerpt, and learn from.

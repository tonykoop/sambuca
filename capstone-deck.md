# Sambuca — Capstone Deck Outline

Slide-by-slide outline for `capstone-deck.pptx`. Aimed at the Fall 2026 capstone window (~Oct–Nov 2026). Audience: recruiters, makers, capstone reviewers, and anyone evaluating the Heifer Zephyr instrument-making practice.

> **One question per slide.** No slide has more than 3–4 bullets. Visuals do the work; text is the caption.

## Slide 1 — Title

**Sambuca: a modern boat-shaped arched harp inspired by the Royal Cemetery of Ur**

- Subtitle: SAM-13-ROOT prototype + parametric family of 5 variants
- Tony Koop, Heifer Zephyr
- Fall 2026 capstone
- Image: HERO-02 front elevation, OR final-prototype photo

## Slide 2 — Provenance & design freedom

**Where this instrument comes from, and what that gives us.**

- BM 121198 from the Royal Cemetery at Ur, c. 2600 BC.
- Curator card: "more accurately described as a boat-shaped harp" — not a lyre.
- Surviving original components: **only** the gold tuning pegs and lapis lazuli decoration. The wood is a 1971–72 reconstruction.
- That means **modern fingerprints are locked, modern wood is free.**
- Image: BM 121198 display photo (credit: © Trustees of the British Museum, photo Don Hitchcock).

## Slide 3 — Fingerprint preservation

**Eight visual elements that read as Sumerian sambuca.**

- Gold-flared cap at the neck top.
- Row of bulb-headed tuning pegs with visible cord-wraps.
- Strong J-curve neck.
- **Multi-strip** lapis band along the soundboard-hull seam.
- Gold-tone brass collar at the neck-body joint.
- Slim boat hull, vertical sides, pronounced bow lift.
- Rectangular pale inlay panel at the bow end.
- Two integral stub feet at the stern keel.
- Image: composite of fingerprint detail shots — DETAIL-04, 05, 07, 08.

## Slide 4 — What I'm modernizing

**Where I depart from the pattern.**

- **Soundhole at the keel**, not the soundboard — projects sound *away* from the player toward the listener.
- **Geared guitar tuners** hidden inside the neck, behind PVD-gold-tone caps + decorative cord wraps.
- **Modern strings** — fluorocarbon trebles + wound nylon basses, 65–80 kgf calibrated total.
- **CNC fabrication** for the hull, neck, inlay, and stand.
- **Japanese kanawa-tsugi joinery** on the stand (a stylistic choice, not Sumerian).
- Image: HERO-03 side elevation with keel-port detail callout.

## Slide 5 — Family spec

**One MasterLayout → five variants.**

- SAM-13-ROOT (build target, 650 mm, G3–E5)
- SAM-19-MID (850 mm, D3–G5, low-back belt)
- SAM-25-CONCERT (1050 mm, A2–A5, sax harness)
- SAM-13-AE (acoustic-electric)
- SAM-13-MULE (tension test mule)
- Image: HERO-05 family lineup OR Sheet 18 family-overview drawing.

## Slide 6 — Parametric SolidWorks workflow

**One MasterLayout part + design table = five buildable instruments.**

- Global equations file (`cad/SAM-000_master-equations.txt`) — single source of truth.
- SolidWorks Equations Manager binds every dimension by name.
- Design table drives 5 configurations from 4 anchor parameters (`body_length_mm`, `string_count`, `f_min_hz`, `f_max_hz`).
- Pack-and-Go from kora → SAM-000 rebuild per `cad/SW-MIGRATION-CHECKLIST.md`.
- Image: screenshot of SolidWorks design-table OR the equations-file header.

## Slide 7 — Acoustic study results

**Predicting and validating the voice.**

- 3.8 L hull cavity (small) + multi-strip cedar soundboard + keel-port Helmholtz at ~143 Hz.
- Coupled cavity-plate pair sits where bass strings live → good radiation in the G3–C4 register.
- Wolfram parametric sweep: soundboard species × thickness × port geometry → optimum is cedar @ 3 mm with 80 × 50 mm oval port.
- Validated on SAM-13-MULE: SPL within 4 dB of prediction.
- Image: voiced-range plot from `wolfram/sambuca-acoustics-starter.wl`.

## Slide 8 — Inlay program

**Multi-strip lapis band + bow inlay panel, all CNC-driven.**

- 5 parallel strips of 1.5 mm dyed-blue veneer with 0.8 mm light spacers.
- Single CNC pass with a 0.8 mm end mill.
- Bow-end pale inlay panel (mother-of-pearl or shell composite).
- Inlay program parametric — scales with `scale_factor` for SAM-19/25.
- Image: BL-06 soundboard with pocket cut + DETAIL-07 finished band.

## Slide 9 — Build sequence

**12 stages, 60–90 hours of active build time over 6–10 weeks.**

- Stage 1: hull (CNC-from-block OR stave-laminated).
- Stage 2: neck (3-laminate sapele, CNC sweep).
- Stage 4: scarf joint + brass collar (highest-risk structural step).
- Stage 9: string-holder strip voicing on SAM-13-MULE (then locked on ROOT).
- Stage 10: **30-day MULE tension hold + ROOT stringing** (the public-release gate).
- Image: build-log thumbnails BL-01, BL-03, BL-09, BL-15.

## Slide 10 — Validation gates

**Three blockers between private review and public release.**

- **Structural:** SAM-13-MULE 30-day neck-deflection hold under reduced tension. Pass = ≤2 mm at gold cap.
- **Cultural:** advisor review of provenance language. Sumerian pattern is public domain; *sambykē* etymology is honestly flagged as contested.
- **Brand:** Heifer Zephyr wordmark placement (soundboard inlay vs stand-only) locked.
- Image: V-S-01 dial-indicator setup OR a private-review banner mockup.

## Slide 11 — Cultural provenance language

**The public-release standard, locked.**

- Inspired by the Sumerian pattern (~4500 years old, public domain).
- *Not* a reproduction of any specific artifact.
- *Not* a recreation of any reconstructed instrument.
- *Not* a claim of cultural authority over any modern living tradition.
- *Sambykē* etymological link to the Sumerian form is historically debated; this build adopts the term while acknowledging the uncertainty.
- Image: clean type-only slide with the verbatim language.

## Slide 12 — Finished prototype

**SAM-13-ROOT, finished, tuned, played.**

- Photo: HERO-01 three-quarter hero shot.
- One-line: "Acoustic harp inspired by a pattern 4500 years older than this room, built with CNC and tuned for the room you'd play it in."

## Slide 13 — What I learned

**Three honest takeaways.**

- The string-holder strip belongs in arched-harp practice; the "bridge bar" was a kora-pattern leak that almost cost me a wrong build. Reverse-engineering happened in real time during this packet build.
- The coupled cavity-plate analysis predicts voice more accurately for arched harps than the single-cavity model I started with.
- The "fingerprint preservation, modernize everything else" framing scales — works for the sambuca, would work for any pattern instrument with surviving fragments + interpretive wood.

## Slide 14 — What's next

**The roadmap from prototype to release.**

- Cultural advisor review (in progress).
- SAM-13-MULE build for tension validation.
- Brand integration option locked.
- Public release with `site/index.html` + GitHub repo + capstone showing.
- SAM-19-MID and SAM-25-CONCERT builds queued for 2027.
- Image: roadmap timeline OR a clean SAM-19 vs SAM-25 size comparison.

## Slide 15 — Credits & sources

**Where this came from, who's owed credit.**

- British Museum object 121198 (© Trustees of the British Museum, CC BY-NC-SA 4.0). Photos by Don Hitchcock, 2015.
- Herbology Manchester supplemental profile photo.
- Penn Museum object 47880 / B16728 (courtesy Penn Museum).
- Kora MasterLayout as parametric template (`C:\Users\Tony\Documents\GitHub\kora`).
- Heifer Zephyr workshop, Maker Nexus shop access.
- Tony Koop, with the `instrument-maker-v4` skill from Anthropic.

## Slide notes — production

- Speaker notes per slide live in the .pptx file.
- Image references map to `images/` directory; missing-image slides carry a placeholder caption ("[image: see photo-shotlist HERO-01]") until the photo set is captured.
- The "Heifer Zephyr brand placement" callout on slide 12 is *deliberately neutral* — both options A and B are tested; the final brand inlay only appears in the deck after V-B-01 closes.

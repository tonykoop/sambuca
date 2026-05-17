# Reverse-Engineering Analysis — Boat-Shaped Harp / Sambuca

**Subject:** British Museum object 121198 (b/c), reconstructed boat-shaped harp from the Royal Cemetery at Ur, c. 2600 BC. Sumerian.
**Analyst:** Tony Koop with Claude (anthropic-skills:reverse-engineer).
**Date:** 2026-05-16.
**Intake mode:** Photos (BM gallery + display-card transcription + Herbology Manchester profile + Royal Cemetery cylinder seal) + named-object + user-supplied design intent.

---

## Taxonomy — locked

**Boat-shaped arched harp ("sambuca").** Not a lyre.

The British Museum's own curator card on the gallery display is unambiguous: *"This object … has often been referred to as a lyre but is more accurately described as a boat-shaped harp and is labelled as such in the 'Early Mesopotamia' gallery where it is displayed."*

True lyres have two arms joined by a yoke crossbar; strings run roughly parallel to the soundboard from yoke to bridge. The sambuca has a single curved cantilever neck rising from one end of a boat-shaped resonator; strings fan from points along the neck down to a bridge on the soundboard. Different topology, different acoustic load path, different SolidWorks backbone. Calling it a lyre is the popular misnomer.

Tony's accepted naming pool: sambuca / boat-harp / sailboat harp / arched harp. Primary repo and brand term: **sambuca**.

---

## Input Inventory

| Input | Type | Confidence |
|---|---|---|
| BM display photo (multi-angle composite) | image | observed |
| BM display card text (transcribed from photo) | text + measurements | observed/measured |
| Herbology Manchester supplemental profile photo | image — provided by Tony as direct upload | observed |
| Royal Cemetery cylinder seal (Penn Museum B16728) photo | image — provided by Tony | observed |
| Penn Museum object 47880 / B16728 catalog data (markdown export) | text — provided by Tony | observed |
| Named object: "Lyre from Ur" | label | corrected to boat-shaped harp per curator |
| User design intent: CNC body/neck, guitar tuners, Broinwood inlay, modern strings, soundhole at keel, 13–25 string family, harness for larger configs, SolidWorks top-down, Wolfram acoustic study, curved CNC stand, Japanese joinery | user-stated | observed (user intent) |
| Kora repo and MasterLayout xlsx as parametric template | files | observed |
| Existing kora work at `C:\Users\Tony\Documents\GitHub\kora` | repo | observed |

---

## Measured Values (from BM display card)

| Parameter | Value | Source |
|---|---|---|
| Body length | 650 mm | BM card |
| Body width | 150 mm | BM card |
| Instrument height (top of gold cap → bottom of body) | 810 mm | BM card |
| Total display height (with stand) | 1085 mm | BM card |
| String count | 13 | BM card + photo count |
| Stand height (display rest) | 275 mm | derived (1085 − 810) |
| Slimness ratio (length:width) | 4.33 : 1 | derived |
| Date | ~2600 BC | BM card |
| Catalog | BM 121198 (b/c) | BM |
| Surviving original components | gold tuning pegs, lapis lazuli decoration band, wood (reconstructed) | BM card |
| Cylinder seal B16728 dimensions | 4 cm length × 2 cm dia, lapis lazuli | Penn Museum catalog |
| Cylinder seal date | 2500–2340 BCE (Early Dynastic IIIB) | Penn Museum catalog |
| Cylinder seal findspot | PG 800B, leaning against Pu-abi's right arm | Penn Museum catalog |

---

## Observed Facts (from the photos)

### From the front-quarter BM display photo and gallery composite

- **Body:** half-ellipsoid "boat" hull, narrow and long. Slim — 4.33:1 length-to-width is much narrower than typical harp resonators.
- **Soundboard:** flat panel on the top of the boat, decorated with inlay.
- **Lapis lazuli band:** dark blue inlay running longitudinally along the seam where soundboard meets hull. This is one of the surviving original components.
- **Neck:** single tall curved member rising from one end of the boat. Strong J-curve. Sheathed with what appears to be a continuous decorative strip; 13 gold bulb-headed tuning pegs march down the neck face.
- **Gold cap:** small flared trumpet/funnel terminal at the top of the neck.
- **Gold/lapis collar:** at the neck-to-body joint, where the cantilever meets the hull.
- **Tuning pegs:** 13 gold bulbs along the neck — these are the actual surviving Sumerian components, not just decoration.
- **Stand:** simple wooden cradle holding the body upright for display. Likely museum furniture, not part of the instrument as played.

### From the Herbology Manchester profile photo

- **Body depth confirmed comparable to body width.** Side view shows the hull is roughly as deep as it is wide — `D ≈ 150 mm` holds, possibly slightly deeper (160–170 mm); not a flat-bottomed shallow trough.
- **Two stub feet** at the bottom of the keel confirmed — these appear to be integral to the body, not part of the museum stand.
- **String termination — no separate bridge bar.** The strings terminate directly at the soundboard near the **bow end** (close to where the neck meets the body). This is the standard arched-harp pattern (matches ancient Egyptian arched harps and the still-played Burmese *saung gauk*) — there is no raised bridge piece like a guitar or violin has. The string-termination line on the soundboard *is* the bridge. The dark transverse form visible across the soundboard near the bow is most likely a glued-on **string-holder strip** with tie-through holes, not a bar that strings pass over.
- **What I previously called a "structure at the far end"** appears on closer reading to be a decorative cap or carved finial at the stern, not a string anchor.
- **Gold collar at neck-body joint** clearly visible — broad band wrapping the joint, with what appears to be the lapis lazuli decoration continuing as binding along the soundboard's edge.
- **Bow lift** — the bow end of the boat curves up slightly, like a small skiff. Not just a half-ellipse; there's deliberate sheer.

### From the second photo set (added 2026-05-16, mid-packet)

Three additional BM 121198 photos arrived during the instrument-maker-v4 packet build. They refine and extend several earlier observations:

- **Lapis lazuli band is multi-strip, not a single band.** A close-up of the soundboard-hull seam shows ~4–5 parallel strips of dark blue lapis with thin lighter spacers between them. Total band width still around 12–18 mm, but composed of nested parallel lines, not a single strip. This is a more elaborate inlay program than the earlier observation captured.
- **Rectangular inlay panel on the bow end of the soundboard.** A roughly 100 × 60 mm pale rectangular panel (mother-of-pearl, shell, or pale stone — material indeterminate from photo) is inset into the soundboard at the bow end. The string-holder strip sits at or adjacent to this panel; the panel is part of the visual fingerprint of the bow-end string-anchor zone. This was not captured in the earlier observation pass.
- **Two dark stub blocks at the stern keel.** Visible as two distinct dark blocks attached to or integral with the keel near the stern, separate from the museum cradle stand. Reading either as (a) integral wooden stub feet — matching the Herbology profile evidence — or (b) carved decorative figurines (bull-foot is a known Sumerian iconographic motif). Either way, part of the original fingerprint.
- **Pronounced bow lift confirmed.** The bow end of the hull lifts upward like a small skiff prow — more deliberate sheer than a plain half-ellipse. Earlier estimate of 10–15° tangent rotation holds.
- **Peg detail refined.** Each tuning peg presents as a wooden shaft + green-whipped cord wrap at the string-attachment point + gold bulb cap. The green is likely aged silk or sinew. For the modern build, this means the PVD-gold-tone bulb cap is correct, plus a separate visible decorative cord wrap at the string-tie point — the wrap is a distinct fingerprint element, not subsumed by the cap.

### From the Royal Cemetery cylinder seal (Penn Museum B16728 / object 47880)

**Provenance confirmed via Penn Museum catalog:**

- Object: **Cylinder Seal B16728**, lapis lazuli, 4 cm length × 2 cm diameter.
- Dated: 2500–2340 BCE (Early Dynastic IIIB) — overlaps with BM 121198 boat-harp.
- Findspot: PG 800B at Ur, **found leaning against Queen Pu-abi's (Shubad's) right arm** in her tomb.
- Currently on display in Middle East Galleries at the Penn Museum, Philadelphia.
- Field number U.10872; CDLI P269965; credit British Museum / University Museum Expedition to Ur, 1928.

**What the seal depicts (per Penn Museum description):**

A double-register all-female banquet scene. The bottom register includes "a separate scene [that] depicts a musical performance, in which **one woman plays a small four-stringed instrument** accompanied by two women who clap cymbals and perhaps sing."

**What this tells us — and what it doesn't:**

- ✅ **Held-vertical seated playing position** is anchored: a player seated, instrument against the body, neck/arm rising in view of the carver. Matches the user-stated design intent for the modern sambuca.
- ✅ **Musical instruments from Pu-abi's tomb context include curved-arm stringed instruments** — same archaeological assemblage as BM 121198.
- ⚠️ **The instrument depicted on the seal is small and four-stringed**, not the 13-string boat-harp. It is *not direct evidence* for the BM 121198 form, but it does belong to the same Sumerian musical-instrument family.
- The carving is highly stylized at 2 cm seal-roll scale; do not extract dimensions from it.

---

## Inferred Facts

| Claim | Basis | Confidence |
|---|---|---|
| Body depth ~140–170 mm (half-ellipse) | Herbology profile + proportions vs. body width | medium-high |
| Strings terminate at a string-holder strip glued near the bow end of the soundboard (no raised bridge bar) | matches standard arched-harp practice; visible dark strip near bow in photos | high |
| Bass strings ~550–620 mm speaking length | neck reach + string-holder strip position | medium |
| Treble strings ~180–230 mm speaking length | tuning-point spread on neck | medium |
| Originals strung with gut or twisted sinew | well-established 3rd-millennium BC practice | high |
| Originals tuned with cord-wrap or peg-and-stick (no geared pegs) | matches all Royal Cemetery reconstructions | high |
| Reconstruction in photos uses modern joinery, not original techniques | photo finish + intact condition | high |
| Internal structure of hull: hollow, no soundpost, possibly one or two light braces | matches arched-harp practice | medium |
| Played seated, body held against torso, neck vertical | cylinder seal B16728 + comparative ethnomusicology | high |

---

## Assumptions

- Pictured object is the 1971–72 reconstruction, not the artifact itself.
- Neck is a structural cantilever, not decorative.
- Body is hollow with soundboard as primary radiating surface.
- The "stacked rings" on the neck are the tuning pegs (gold bulbs), not separate decoration.

---

## Unknowns (assigned to next-phase work)

- Total string tension at chosen modern string set + tuning → trade study.
- Wood species (originals: mixed; reconstruction unknown; build choice open).
- Soundboard species, thickness, bracing → Wolfram acoustic study.
- Neck-to-body joint geometry → maker-engineering trade study.
- Whether a stiffening brace inside the hull is needed under modern tension → CAE / prototype.
- Body depth, exact: 150 mm estimate consistent with photos, ±20 mm uncertainty remains.

---

## Mechanism / Construction Hypothesis

**Load path under string tension.** Each string pulls between its tuning point on the curved neck and the string-holder strip glued to the soundboard near the bow. The vector sum pulls the top of the neck toward the bow of the body — the neck acts as a curved cantilever rooted in the stern of the hull. Bending stress is highest at the neck-to-body joint. The soundboard sees an in-plane pull from the strings plus a small downward component from the string break-angle as the strings leave the tie-through holes. The hull resists soundboard collapse and provides cavity volume.

**Acoustic mechanism.** Each string is a 1-D vibrating string (f = (1/2L)·√(T/μ)). Energy couples through the string-holder strip into the soundboard. The soundboard radiates as a plate (its own mode set) and excites the air volume in the boat hull. Cavity behavior is dominated by the long axis given the 4.33:1 slimness — first longitudinal mode estimated near 265 Hz (c/2L for a closed cavity with one soft face). First transverse mode is much higher (around 1100 Hz).

**Voice prediction.** Bass strings will fall below the first cavity mode, putting them in the stiffness-controlled regime where soundboard plate modes dominate. Middle and treble strings will live near or above the first cavity mode. The soundboard species + thickness + bracing pattern will dominate the voice — even more than usual for a stringed instrument.

---

## Design Freedom Map

The single biggest insight: the BM card says the wood "was reconstructed on the basis of representations of the instrument on seals, and on sketches made at the time of excavation." Only the **gold tuning pegs and lapis lazuli** are surviving Sumerian material. The wood is 20th-century interpretation.

That means the **fingerprint elements** that visually identify the instrument as Sumerian sambuca are:

1. Gold-flared cap at the top of the neck.
2. Row of bulb-headed tuning pegs (13) running down the neck face — each with a visible cord-wrap at the string-tie point below the bulb.
3. Strong J-curve of the neck meeting the body near horizontal at the stern.
4. **Multi-strip** lapis lazuli decorative band (4–5 parallel lines) along the soundboard-hull seam.
5. Gold collar / binding at the neck-to-body joint.
6. Slim boat hull with vertical-ish sides, pinched bow/stern, and a pronounced upward bow lift.
7. **Rectangular pale inlay panel** (mother-of-pearl or shell) on the bow end of the soundboard, framing or adjacent to the string-anchor zone.
8. **Two stub blocks at the stern keel** — integral feet or decorative figurines.

Preserve those, and you have a sambuca. Hull curvature profile, soundboard arching, internal bracing, neck thickness, hull stave count, foot/stand interface, *string count*, *scale*, *soundhole geometry* — all open. The Sumerian pattern *licenses* a family of modern instruments.

---

## Dimension Anchors (locked)

| Feature | Value | SolidWorks parameter |
|---|---|---|
| Body length | 650 mm | `body_length_mm` |
| Body width | 150 mm | `body_width_mm` |
| Instrument height | 810 mm | `instrument_height_mm` |
| Body depth (estimate) | 150 mm (140–170 range) | `body_depth_mm` |
| String count (root variant) | 13 | `string_count` |
| Slimness | 4.33 | derived |

---

## Material and Process Notes

| Component | Candidate | Rationale |
|---|---|---|
| Hull | Cherry, walnut, or sapele | Bendable in stave construction; CNC-friendly |
| Soundboard | Engelmann or Sitka spruce, 3 mm | Standard harp soundboard species |
| Bracing | Spruce | Match soundboard movement |
| Neck | Hard maple or sapele, laminated | Stiff under cantilever load |
| String-holder strip | Walnut, hard maple, or rosewood | High-mass wood for low-end coupling |
| Tuning peg caps | Brass with gold-tone PVD coating | Fingerprint preservation; cheaper than gold leaf |
| Inlay band | Lapis-lazuli-look composite or dyed veneer + epoxy fill | True lapis is brittle and expensive; modern equivalent acceptable |
| Strings | Fluorocarbon (treble) + wound nylon (bass) | Modern playability, low total tension |
| Neck collar | Brass or bronze | Functional + visual fingerprint |
| Stand | Walnut or matching hull species | Joinery showpiece |
| Harness (SAM-19/SAM-25 only) | Padded ballistic nylon + leather + steel D-rings | Aftermarket sax-harness-derived |

Full details and trade-offs in `design.md`.

---

## Confidence Notes

- **High** confidence: family taxonomy (boat-shaped arched harp), anchor dimensions (BM-measured), surviving-material identity (gold + lapis), load-path mechanism, acoustic class, held-vertical seated playing position.
- **Medium** confidence: body depth (Herbology profile narrows it to ~150 mm), exact string lengths, neck arc profile, exact bow-end position of the string-holder strip.
- **Low** confidence: any claim about how the original sounded — we have no recordings, only inferences from material studies and comparative ethnomusicology. Specific tuning-system claims for the Sumerian original are entirely speculative.

---

## Measurement Requests (resolved / remaining)

### Resolved this session

- ✅ **Profile angle of the boat** — Herbology Manchester photo confirms body depth ≈ width, two integral stub feet, prominent gold collar at neck-body joint.
- ✅ **Playing position** — Royal Cemetery cylinder seal B16728 anchors the held-vertical seated-with-instrument-against-body position; matches the user-stated design intent.
- ✅ **Penn Museum catalog cross-reference** — confirms cylinder seal is *not* the same instrument as BM 121198 (small four-stringed, not the 13-string boat-harp), but is contemporary archaeological context from Pu-abi's tomb.

### Still open (not blockers for build packet)

1. **String-holder strip exact position along the bow-end of the soundboard** — within a band of maybe 50–100 mm along the bow, the exact placement affects the bass-string speaking length and the soundboard's response curve. Recommend prototyping with a glued-on strip whose final position is tuned during initial stringing; commit only after voicing.
2. **Body depth direct measurement to ±5 mm** — current 150 mm estimate is consistent with the Herbology Manchester profile but could be confirmed via BM curator request.
3. **Original Woolley field sketches** (1922–34 expedition, published in *Ur Excavations* vol. 2: The Royal Cemetery, 1934) — likely contain dimensional notes the BM card abstracts away. Library / inter-library loan candidate.

---

## Builder Readiness

**Status: ready for engineering trade study and build packet.** The functional goal is clear, anchor dimensions are measured, materials are substitutable, IP is public domain (4500 years), and remaining unknowns are assigned to specific design/test phases.

Gate met for handoff to:

- `maker-engineering` — structural trade study (neck cantilever + joint).
- `instrument-maker-v4` — full build packet (BOM, sourcing, cut list, CNC plan, capstone deck).
- Wolfram Cloud — acoustic parametric sweep.
- SolidWorks MasterLayout — rebuild from kora Pack-and-Go per `cad/SW-MIGRATION-CHECKLIST.md`.

---

## Sources

- British Museum object 121198, gallery display card photographed by Don Hitchcock, 2015. Text © Trustees of the British Museum, CC BY-NC-SA 4.0.
- Herbology Manchester (2015), supplemental profile photo of BM 121198. Provided by Tony Koop, 2026-05-16.
- Royal Cemetery cylinder seal, Penn Museum **B16728** / object **47880**, *Cylinder Seal*, lapis lazuli, c. 2500–2340 BCE, found against Queen Pu-abi's right arm at PG 800B, Ur. https://www.penn.museum/collections/object/47880 — primary evidence for the held-vertical seated playing position; depicts a different (4-string) instrument from the same archaeological context.
- Woolley, C. L. (1934). *Ur Excavations, Vol. II: The Royal Cemetery.* British Museum / University of Pennsylvania Museum joint publication.
- Tony Koop's prior kora work at `C:\Users\Tony\Documents\GitHub\kora` — adopted as parametric template.

---

## Next Handoff

This reverse-engineering pass is complete; the gate to next-phase work is open. Three handoffs queued, in suggested order:

### 1. SolidWorks MasterLayout build → see `cad/SW-MIGRATION-CHECKLIST.md`

The Pack-and-Go produced `SAM-000_MasterLayout.SLDPRT` and `SAM-000_SAMBUCA.SLDASM` with kora geometry inside renamed files. Path A (rebuild) is recommended over Path B (edit-in-place). Equation block ready to paste from `cad/SAM-000_master-equations.txt`. Calibration warning noted: starter string-diameter ramp produces 103 kgf total tension on SAM-13-ROOT vs. 65–80 kgf target — adjust before locking the design table.

### 2. Wolfram Cloud acoustic study → see `wolfram/sambuca-acoustics-starter.wl`

Sweep soundboard species × thickness × keel-port geometry across the three family variants. Confirm the 143 Hz keel-port Helmholtz prediction with a real boundary-element or finite-element check before committing to port dimensions.

### 3. `instrument-maker-v4` build packet → see `INSTRUMENT-MAKER-PROMPT.md`

Once the SW model rebuilds cleanly across configurations, hand off to the `instrument-maker-v4` skill for the full build packet: BOM, sourcing, cut list, CNC operation plans, validation tests, capstone deck, learn-to-play folder, print packet, public site. The prompt is pre-staged in this repo's root so it's ready to paste into a fresh session.

### Sub-handoffs that could parallelize

- `maker-engineering` for the neck-to-body joint trade study (highest-risk structural decision).
- `laser-art` for the Broinwood-style inlay program (parametric soundboard + neck-band motifs).
- `sheet-music` for the `learn-to-play/` starter songbook once the tuning system is locked.

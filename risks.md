# Sambuca — Risk Register

Red-team pass against the SAM-13-ROOT build target and the four sibling variants. Every risk gets a verification test attached. Categories: structural, acoustic, ergonomic, supply, fit/finish, safety, cultural.

Severity scale: **L** = low (cosmetic / recoverable), **M** = medium (rework cost or schedule hit), **H** = high (build-blocking, safety, or release-gating).

---

## Structural

### R-S-01 — Neck cantilever failure under full string tension [H]

The 13-string load resolves into a horizontal pull at the top of the neck (~660 mm above the joint) of roughly 50–65 kgf at the calibrated 65–80 kgf total tension target. The neck-to-body joint sees a bending moment of ~33–43 kgf·m. Sapele cantilever is structurally adequate in calculation, but glue-line strength at the brass collar / scarf joint is the single point of failure.

**Verification:** SAM-13-MULE build at reduced tension (3.0–4.5 kgf/string × 13 = ~50 kgf total). Hold for 30 days, measure neck deflection at the gold cap relative to the body. Pass criterion: ≤2 mm deflection, no audible creak under tuning. Escalate to full ROOT tension only after MULE clears.

### R-S-02 — Brass collar mixed-material seasonal movement [M]

The brass neck collar wraps a glued scarf joint between sapele neck and walnut hull. Brass thermal-expansion coefficient (~19 ppm/°C) is roughly 3× that of either wood. Across a 20°C ambient swing the differential is ~0.4 mm circumferentially on a 60 mm collar — not catastrophic, but enough to telegraph as a hairline gap in finish. Worse: humidity swings move the wood more than the brass, creating a tight-in-summer / loose-in-winter cycle.

**Verification:** Build a test collar on the SAM-13-MULE; install a 0.1 mm gap-monitor at one circumferential position; record at 4-week intervals across a full seasonal cycle. If gap exceeds 0.3 mm, redesign the collar as two half-collars with a hidden expansion gap, or shift to a thinner brass overlay over a structurally-glued wooden interior collar (the brass becomes purely decorative).

### R-S-03 — Keel-port placement vs. structural keel stiffener [M]

The keel port (80 × 50 mm oval at 55% of body length from bow) is cut through the centerline of the keel — exactly where a longitudinal stiffener would normally live if the hull needed one. The cut removes structural capacity at the deepest point of the keel curve.

**Verification:** Run a Wolfram or simple beam analysis on the keel section with and without the port cut. If keel deflection under tension load exceeds 1.5× the no-port case, add a transverse internal brace fore and aft of the port (12 × 12 mm cherry, glued to the inside of the keel). Verify on the SAM-13-MULE before the SAM-13-ROOT cut is committed.

### R-S-04 — Soundboard collapse under combined string and bracing load [M]

The soundboard is 3 mm cedar — thin for a stringed instrument. Under the in-plane pull from the string-holder strip (~50–65 kgf horizontal force) plus the small downward break-angle component, an unbraced cedar soundboard could deflect or crack near the strip. The string-holder strip's hide-glue mounting must transfer load into the soundboard without delaminating.

**Verification:** Light fan-bracing pattern under the strip area (3 × 8 mm cedar braces radiating from the strip toward the inlay band). Pull-test the glued strip on a scrap cedar panel to failure; record breaking load and failure mode. Pass criterion: glue line holds to 2× expected service load.

### R-S-05 — Stern eyebolt pull-through on SAM-19 / SAM-25 harness load [H]

The harness eyebolt (M6 stainless, through-hull with hardwood backing plate) carries the full weight of the instrument when worn (saxophone-harness mode on SAM-25). Instrument weight estimated ~3.2 kg for SAM-25; safety factor of 5× → ~16 kgf working load. The backing plate is 10 × 25 × 40 mm hardwood glued to the inside of the hull.

**Verification:** Static pull test the backing plate to 30 kgf (~9× working load) on a scrap hull panel before the production eyebolt is installed. Record failure mode. Pass criterion: holds 30 kgf for 60 seconds without visible glue-line movement.

---

## Acoustic

### R-A-01 — Small cavity volume + quiet voice on SAM-13-ROOT [M]

The 3.8 L hull volume is small for a stringed instrument with 13 strings. Predicted SPL is below modern lever-harp expectations.

**Verification:** Wolfram parametric sweep across soundboard species × thickness × keel-port geometry produces a predicted SPL curve. Build the SAM-13-MULE and measure SPL at 1 m with a calibrated SPL meter, playing a standard exercise. If measured SPL is more than 6 dB below the prediction, escalate to: (a) thinner cedar (2.5 mm), (b) reduced bracing, (c) larger keel port, or (d) the SAM-13-AE pickup configuration for performance use.

### R-A-02 — Tuning instability under temperature/humidity [M]

Fluorocarbon strings hold tuning well in steady-state but drift in humidity transitions. Geared guitar tuners hidden behind PVD bulb caps should hold position once locked, but the wooden shaft + cord-wrap fingerprint element introduces a sliding-fit interface that could creep.

**Verification:** Tune SAM-13-MULE to standard pitch, leave in playing-temperature room for 24 hours, then measure cents-error per string. Pass: <±10 cents drift on any string. If fail, replace decorative cord-wrap with a glued (non-sliding) version that still presents the visual element.

### R-A-03 — Coupled cavity-plate mode mismatch [M]

The Wolfram model predicts the cavity Helmholtz mode (with keel port) at ~143 Hz and the first plate mode in roughly the same range. If the two are too far apart (>1 octave), the coupled response will have a "hole" in the lower midrange where neither mechanism radiates well; if they coincide too precisely, the coupled pair becomes a single resonance that overwhelms one note.

**Verification:** Sweep frequency response on the SAM-13-MULE with a small speaker driving the soundboard at 50 Hz – 2 kHz; record SPL at the keel port. Look for the coupled-pair signature (two peaks split by ~30–80 Hz). If the spacing is wrong, the keel port `keel_port_long_mm` and `keel_port_short_mm` parameters tune the Helmholtz frequency.

---

## Ergonomic

### R-E-01 — Forward-facing playing position fatigue [L]

The symmetric forward-facing position (long axis between thighs, neck rising away from torso) is comfortable for short sessions but may produce neck or upper-back tension during sustained play because both arms reach forward equally. Different from traditional harp posture (one arm reaches across the body).

**Verification:** 30-minute playing sessions on the SAM-13-MULE with a postural observer. Record posture drift, time-to-first-fatigue, hand position. If sessions consistently produce upper-back fatigue, document recommended-session-length (e.g., "20 min then 5 min break") in the print packet's user guide.

### R-E-02 — Keel port impingement on player's clothing / thigh [L]

The keel port faces forward and downward; with the boat between the thighs, the port may be partially covered by player's pants or thigh contact, reducing radiation toward the listener.

**Verification:** Test on the SAM-13-MULE in seated position with three different player heights / leg-spreads. Document the playing-position photos in `photo-shotlist.md`. If the port is being blocked, document a "thighs-open" playing posture or a small port deflector.

---

## Supply

### R-X-01 — Lapis-look composite or dyed-veneer-and-epoxy availability [L]

The multi-strip lapis band needs 5 parallel strips of dyed-blue veneer (or composite lapis tile). Suppliers vary in color consistency and stock width.

**Verification:** Order test stock from two suppliers; finish-match samples side-by-side. Build a 100 mm test inlay band and confirm CNC routing tolerances. Lead time ~3 weeks; place orders in first month of the schedule.

### R-X-02 — Mother-of-pearl or shell composite for bow inlay panel [L]

The rectangular bow-end inlay panel needs ~100 × 60 mm of pale, period-evoking material. True mother-of-pearl is expensive and brittle. Shell-look composite is workable but visually different.

**Verification:** Compare three candidates (true MOP, abalone composite, pale-stone composite) on a scrap soundboard sample for visual match to the BM photo reference. Pick before committing.

### R-X-03 — PVD-gold-tone brass bulb caps — supplier search [M]

The decorative bulb caps over the geared tuners are the most visible fingerprint element after the neck and lapis band. Off-the-shelf options are rare; this is likely a custom-machined or CNC-turned + PVD-coated part.

**Verification:** Two-pronged search: (a) Maker Nexus shop CNC-turn a sample cap from brass rod + finish at a local PVD shop; (b) source from a small-batch jewelry/clock-parts supplier. Pick the cheaper path that delivers acceptable finish by month 3 of the schedule.

### R-X-04 — Geared guitar tuners fitting inside the neck cross-section [M]

The neck face is 38 mm wide (`neck_width_mm`); standard guitar tuners need ~50 mm of clearance behind the post for the gear housing. The neck depth of 50 mm (`neck_depth_mm`) may be too tight depending on tuner choice.

**Verification:** Order one sample geared tuner, mock-fit into a neck cross-section dummy. If too deep, switch to compact-housing classical-guitar tuners or worm-and-gear harp tuners. Re-spec `neck_depth_mm` if needed.

---

## Fit / finish

### R-F-01 — Multi-strip lapis band CNC tolerances [L]

5 parallel strips × 1.5 mm wide × 0.8 mm spacers requires a 0.8 mm or 1.0 mm end mill on the CNC at depths of 1.5 mm. Tool deflection or breakage is possible.

**Verification:** Run a test inlay band on scrap cedar with the planned end mill; inspect for tool-deflection-induced strip-width variation. Pass criterion: strip width consistent to ±0.2 mm across the band length.

### R-F-02 — Brass collar / wood color transition aesthetic [L]

The brass collar sits between sapele neck and walnut hull. The color transitions need to feel intentional, not jarring. Polished brass is bright; aged/patinated brass is closer to the original gold collar's color.

**Verification:** Finish two test collars — one polished, one chemically aged to a deeper gold tone. Photograph both on a sapele/walnut test joint. Pick before production.

---

## Safety

### R-Z-01 — String breakage at full tension [M]

Fluorocarbon strings under tension store energy; a treble string breaking at ~7 kgf releases that energy as a sharp recoil. The player's face is roughly 200 mm from the top of the neck during play.

**Verification:** Use only fresh strings; replace at the first sign of wear. Document recommended re-stringing intervals in the assembly manual. Note in the user guide: "remove tension fully before any soundboard or strip work."

### R-Z-02 — Saxophone-harness sudden release on SAM-25 [M]

The SAM-25's harness clip is rated for ~16 kgf working load (R-S-05). If the clip fails or the player accidentally disengages it mid-performance, the ~3.2 kg instrument drops to the floor.

**Verification:** Specify a locking (not snap-only) carabiner-class hook for the harness. Document a pre-performance harness check in the user guide.

---

## Cultural

### R-C-01 — Cultural-advisor review finds language insufficient [H]

The "Cultural provenance language (locked for public release)" section of `design.md` is the build packet's claim against misappropriation concerns. The cultural-advisor review gate is one of the three blockers on public release.

**Verification:** Submit `design.md` cultural-provenance section to an advisor with expertise in either Mesopotamian musicology (Andrew Lawler at U Penn / Penn Museum, or equivalent) or living-tradition stewardship advocacy. Document advisor feedback. If they red-line, revise and resubmit. Do not publicly release before written sign-off.

### R-C-02 — *Sambykē* etymological claim contested [L]

The repo and brand term is "sambuca," which evokes the Hellenistic Greek *sambykē* — itself a contested-etymology word. A historian could object that the etymological link to the Sumerian instrument is speculative.

**Verification:** The cultural-provenance language above explicitly acknowledges the uncertainty: "historically debated as a possible descendant of the Sumerian form … not a claim of identity with the Greek instrument." If the cultural advisor wants stronger language, accept the revision; the repo can be renamed if the etymology proves untenable.

### R-C-03 — Imagery in capstone deck and build-log misappropriates living-tradition aesthetics [M]

The Broinwood-style inlay program could pull motifs from the cylinder-seal scenes (Royal Tomb procession, etc.) that, while ancient, are part of the Mesopotamian cultural heritage of modern Iraq. Iraqi cultural-heritage advocates could reasonably ask that imagery be credited to its source.

**Verification:** All cylinder-seal imagery in the deck and build-log is captioned with its catalog source (BM 121198, Penn Museum B16728, etc.) and credited "© Trustees of the British Museum" or "Courtesy Penn Museum, University of Pennsylvania." Confirm with cultural advisor.

---

## Risk summary

| Risk | Severity | Owner | Validation surface |
|---|---|---|---|
| R-S-01 Neck cantilever failure | H | structural-test | SAM-13-MULE 30-day hold |
| R-S-02 Brass collar seasonal movement | M | structural-test | seasonal gap monitor |
| R-S-03 Keel port vs keel stiffener | M | Wolfram + MULE | beam analysis + MULE keel deflection |
| R-S-04 Soundboard collapse | M | structural-test | pull-test on scrap |
| R-S-05 Eyebolt pull-through (SAM-25) | H | structural-test | 30 kgf static pull test |
| R-A-01 Quiet voice on SAM-13-ROOT | M | acoustic-test | SPL measurement vs prediction |
| R-A-02 Tuning instability | M | acoustic-test | 24-hr drift test |
| R-A-03 Coupled mode mismatch | M | acoustic-test | sweep frequency response |
| R-E-01 Playing position fatigue | L | ergonomic-test | 30-min playing sessions |
| R-E-02 Keel port impingement | L | ergonomic-test | seated-position photo set |
| R-X-01 Lapis stock availability | L | sourcing | two-supplier sample compare |
| R-X-02 MOP / shell composite | L | sourcing | three-candidate sample compare |
| R-X-03 PVD bulb caps | M | sourcing | parallel custom-shop + jewelry-supplier search |
| R-X-04 Tuner fit in neck | M | sourcing | mock-fit before commit |
| R-F-01 Multi-strip CNC tolerances | L | CNC-test | scrap-cedar test inlay |
| R-F-02 Brass color transition | L | finish-test | polished vs aged sample |
| R-Z-01 String breakage | M | safety | user-guide doc |
| R-Z-02 Harness release | M | safety | locking hook spec |
| R-C-01 Cultural-advisor review | H | cultural review gate | external advisor sign-off |
| R-C-02 *Sambykē* etymology | L | cultural review gate | advisor language pass |
| R-C-03 Imagery attribution | M | cultural review gate | captions + credits audit |

Three risks are public-release-blocking: **R-S-01** (neck cantilever), **R-S-05** (SAM-25 harness eyebolt), and **R-C-01** (cultural advisor review).

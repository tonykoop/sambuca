# Sambuca — Design Notes

## Design intent

A modern, parametric, family-scalable boat-shaped arched harp that preserves the Sumerian visual fingerprint while delivering modern playability, tunability, and projection.

## Reference precedents

| Reference | What it anchors | File in `images/` |
|---|---|---|
| **British Museum 121198** (c. 2600 BC) | Anchor dimensions, slim hull, single-arc neck, gold-bulb tuning pegs, lapis seam band, gold collar fingerprint | `SambucaPhotobyDonHitchcock_BritishMuseum.jpg` |
| **Chang Chogha Mish** (modern maker, after ~3300 BCE Iranian arched-harp tradition) | Deeper hull proportion (D/L ≈ 0.4), lateral wood-bulb tuning pegs, two-band multi-strip inlay (joint + bow edge), bow-side soundboard rose, no flared cap | `چنگ-چغامبش-11-1536x1536-1-2048x2048.jpg` |
| **Penn Museum B16728 cylinder seal** (c. 2500–2340 BCE, Pu-abi's tomb) | Held-vertical seated playing position; archaeological context only — depicts a different (4-string) instrument | not stored locally |

The chang lineage is the broader Persian/Mesopotamian sibling family to the Ur boat-harp. Where the BM reconstruction is small, slim, and gold-accented, the chang tradition supports a fuller, deeper, more concert-sized instrument. The sambuca family draws from both: SAM-13-ROOT closer to the BM proportions, SAM-25-CONCERT closer to the chang proportions.

## Family

Five planned variants (see `family-spec.csv` for full table):

| ID | Role | Strings | Body length × depth | Tuning range | Playing position |
|---|---|---|---|---|---|
| **SAM-13-ROOT** | build target | 13 | 650 × **200** mm (D/L = 0.31, raised from BM's 0.23 per Tony 2026-05-16) | ~1.7 octaves, G3 → E5 diatonic | Seated, body between thighs, neck rising away from torso, both hands symmetric |
| **SAM-19-MID** | scaled mid concert | 19 | 850 × **280** mm (D/L = 0.33) | ~2.7 octaves, D3 → G5 | Seated with optional low-back positioning belt |
| **SAM-25-CONCERT** | concert | 25 | 1050 × **420** mm (D/L = 0.40, chang-like full hull) | ~3.5 octaves, A2 → A5 near-chromatic | Seated or standing; **saxophone-style harness** |
| **SAM-13-AE** | acoustic-electric | 13 | 650 × 200 mm | same as ROOT | same as ROOT; adds under-strip piezo + 1/4" jack in stern stub |
| **SAM-13-MULE** | low-tension test mule | 13 | 650 × 200 mm | same as ROOT, reduced tension (3.0–4.5 kgf/string) | same as ROOT; used for tension + joint + string-holder-strip-position validation |

**Hull-depth update (2026-05-16):** the BM-anchor depth of 150 mm produced a slim hull; the chang reference photo shows the deeper, fuller proportion reads better and gives substantially more cavity volume. SAM-13 raised to 200 mm (D/L = 0.31), SAM-19 to 280 mm, SAM-25 to 420 mm (matches chang proportion). New cavity volumes: 10.2 L / 24.4 L / 56 L respectively — significant projection upgrade across the family.

All five share one MasterLayout part with `string_count` and `body_length_mm` as the family-driving parameters. SAM-13-ROOT is the build target; the other four are documented as Pack-and-Go siblings (mirroring the fujara → moseno pattern).

## Soundhole strategy — at the keel

**Decision:** the soundhole is cut into the *keel* (curved bottom of the hull), not the soundboard.

Rationale:
- In the seated playing position, the boat is held between the thighs with the soundboard facing the player.
- A traditional soundboard rose would project sound *into the player's chest*, where it would be absorbed by clothing and the player's body — wasted radiation.
- A keel-port projects sound **forward and downward toward the listener**, away from the player. Equivalent to side-ports on modern concert harps but cleaner ergonomically for a held-between-thighs instrument.
- This is **not** a feature of the original — the BM reconstruction has no soundhole at all. It's a modern functional improvement consistent with the "preserve fingerprint, modernize everything else" design principle.

**Geometry options to study in Wolfram:**

- Single oval port, ~80 × 50 mm, centered ~55% of length from bow.
- Two smaller round ports flanking the string-holder-strip projected keel line (40 mm dia each).
- Three-port Helmholtz tuning (one keel port + two soundboard rosettes) — most projection but compromises the clean Sumerian top.
- No keel port + dual side-ports near the player's ears — *monitor* design, sacrifices listener-facing volume for player feedback.

Default for first prototype: **single keel port, oval, 80×50 mm, tunable position**. The keel curvature makes the port directional — angling the cut slightly forward biases radiation toward the listener.

## Quiet-instrument mitigation

After the hull-depth update, SAM-13-ROOT cavity is ~10.2 L (was 7.7 L at the slim BM proportion). Mitigations available, ranked by complexity:

1. **Soundboard species + thinness sweep.** Spruce / cedar / redwood at 2.5–4.0 mm. Wolfram-tested before committing.
2. **Keel port** (above) — releases trapped air-pressure modes that would otherwise just heat the cavity.
3. **Bracing topology.** Light fan brace pattern across the soundboard, like a small classical guitar's bracing — adds soundboard area-moment-of-inertia coupling.
4. **Larger family variants.** SAM-19 (~24 L cavity, post-depth-update) and SAM-25 (~56 L cavity, chang-proportioned) self-solve the volume problem by being bigger.
5. **Pickup option.** Under-strip piezo transducer or contact pickup. Acoustic-electric variant for performance settings. See SAM-13-AE family-spec row; `cad/SAM-PICKUP-*` configuration of the MasterLayout.

## Variable string count → variable neck tuning-peg positions

Per the kora MasterLayout pattern, each string's tuning peg position along the neck face is a named global variable (`s1_neck` through `sN_neck`). For sambuca, these are **frequency-driven** rather than fixed proportional positions.

Each string's speaking length:

```
L_n = L_min × (f_max / f_n)^k
```

where:
- `f_n` = string n's pitch in Hz (set by tuning scheme)
- `f_max` = highest string's pitch
- `L_min` = shortest speaking length (mm)
- `k` = curve exponent (k=1 strict inverse-frequency; k≈0.7–0.85 typical of traditional harps because string mass varies across the range)

Each string's tuning peg position along the neck face:

```
s_n_neck = strip_tie_hole_at_string_n_xyz  + L_n × (unit vector from strip tie-hole to neck-anchor for that string)
```

Implementation:
- In SolidWorks: build a 3DSketch driven by string-by-string equations from a design-table column.
- Sweep configurations: change `string_count`, `f_min`, `f_max`, `tuning_scheme`, `k` → all peg positions update automatically.
- Tuning schemes to support: diatonic major, diatonic minor, pentatonic (5-/7-note), chromatic (full), Just intonation variants.

The `cad/SAM-000_master-equations.txt` file in this repo lists the global-variable equations adapted from the kora pattern.

## String termination — no separate bridge bar

The sambuca follows standard **arched-harp practice**: strings terminate directly at the soundboard via a glued-on **string-holder strip** running along the bow-end of the soundboard centerline. There is no raised bridge bar like a guitar or violin has — the string-holder strip *is* the bridge in this instrument class.

| Feature | Spec | Notes |
|---|---|---|
| String-holder strip cross-section | 10 mm wide × 4 mm thick | Walnut, maple, or rosewood — high-mass wood for low-end response |
| String-holder strip length | ~120 mm × `scale_factor` | Spans the 13 tie-through holes |
| Tie-through hole spacing | `string_spacing_mm` (≈ 6 mm for SAM-13-ROOT) | Driven by global equation |
| Tie-through hole diameter | 1.5 mm | Sized for fluorocarbon + knot |
| Position on soundboard | ~80% of body length from stern (i.e., near the bow, close to where the neck meets the body) | Tuneable during prototyping; commit after voicing |
| Mounting | Glued to soundboard with hide glue (reversible if needed) | Hide glue is the standard for stringed-instrument repair access |

**Implication for SolidWorks:** no separate `Bridge` feature is needed. Replace with a `String_Holder_Strip` sketch on the soundboard. The 13 tie-through holes are linear-patterned along the strip, driven by `string_count` and `string_spacing_mm`. Equations file updated accordingly.

## Structural — neck-to-body joint

**Highest-risk joint in the whole instrument.** Under 13 strings at modern fluorocarbon tension (~5 kg/string average), total resultant force pulling the neck toward the bow is ~50–65 kgf, applied at a long lever arm (~660 mm above the joint).

Candidate joints (to red-team in `maker-engineering`):

| Option | Pros | Cons |
|---|---|---|
| Mortise + wedge through-tenon | Visible Japanese-style joinery; serviceable | Hard to CNC the angled mortise in the curved hull |
| Brass / bronze collar + glued lap | Visually echoes the original gold collar; strong | Mixed materials → differential thermal/humidity movement |
| Bolted-and-pinned with hidden plate | Strongest; demountable for travel/repair | Modern-looking unless camouflaged |
| Glued scarf + reinforcing biscuit | Cleanest aesthetic | Single shear path; harder to repair |

**First-pass recommendation:** brass collar over a glued scarf joint, hidden mechanical pin through both members. Visible collar references the original gold collar — fingerprint preserved.

## Stand

Stand is a **display/transport rest**, not a playing fixture (per the seated-thighs playing position).

Two CNC curve-profiled cradle uprights with a Japanese-style **kanawa-tsugi** (mechanical scarf joint with key) connecting the uprights to the base, or **mitsuke-aritsugi** (visible dovetail with mitre return). Both let the CNC handle the curves and the joinery happens at straight intersections.

Material: complementary to or contrasting with the harp wood — walnut against maple, or all-walnut for a unified set.

## Playing position & harness

**SAM-13-ROOT** (seated, body between thighs, neck rising away from torso):
- Long axis of the boat runs forward, between the player's thighs.
- Neck rises away from the player's torso — pointing forward and slightly up rather than toward either shoulder.
- Strings face the player and are accessible by both hands symmetrically; **handedness dissolves** in this orientation, so no left/right default-build is needed.
- Keel port points forward and down toward listener.
- Soundboard faces upward toward the player.
- No harness needed; weight rests on thighs.

The symmetric forward-facing orientation matches the playing position implied by the Royal Cemetery cylinder seal B16728 (held vertical, body against player). It also resolves the handedness question that the kora pattern raised: a kora is asymmetric (strings on both sides of a center post), but the sambuca's single neck face plus forward-facing orientation puts both hands on equal terms.

**SAM-19-MID** (seated with light support):
- Same playing position but heavier instrument; optional padded waist belt with side D-rings (like the first reference image — climbing/work positioning belt repurposed) and a tether strap from belt to the boat's stern.

**SAM-25-CONCERT** (seated *or* standing):
- Standing position requires a **saxophone-style harness** (second reference image): padded shoulder yoke distributing weight across both shoulders, sternum strap, hook clipping to a fixed eyelet on the stern of the boat.
- Standing playing tilts the neck slightly forward; the player's hands access strings comfortably with the boat suspended at sternum height.
- Designable as a separate `harness/` subassembly with adjustable strap lengths.

## Materials — first-pass slate

| Component | Candidate | Rationale |
|---|---|---|
| Hull | Cherry, walnut, or sapele | Bendable in stave construction; CNC-friendly |
| Soundboard | Engelmann or Sitka spruce, 3 mm | Standard harp soundboard species |
| Bracing | Spruce | Match soundboard movement |
| Neck | Hard maple or sapele, laminated | Stiff under cantilever load |
| String-holder strip | Walnut, hard maple, or rosewood | High-mass wood for low-end coupling |
| Tuning pegs | **Modern: zither pegs (wood-bodied with steel hex tip) or geared metal hardware** (see Tuner choice section) | Switched 2026-05-16 from gold-bulb caps; chang-tradition look |
| Inlay band | Lapis-lazuli-look composite or dyed veneer + epoxy fill | True lapis is brittle and expensive; modern equivalent acceptable |
| Strings | Fluorocarbon (treble) + wound nylon (bass) | Modern playability, low total tension |
| Neck collar | Brass or bronze | Functional + visual fingerprint |
| Stand | Walnut or matching hull species | Joinery showpiece |
| Harness | Padded ballistic nylon + leather + steel D-rings | Aftermarket sax-harness-derived |

## Tuner choice (updated 2026-05-16)

Previous fingerprint plan used PVD-gold-tone bulb caps hiding modern geared guitar tuners. Swapped to **modern visible tuner hardware** — two options, both legitimate:

| Option | Description | When to pick |
|---|---|---|
| **A. Zither pegs** | Wood-bodied tapered pegs with steel hex tip (turned with a tuning wrench, like a hammered dulcimer or autoharp). Standard zither hardware, ~6 mm shank, drilled directly into the neck. | Cleanest "chang" look (matches the lateral wood-bulb pegs in the reference photo); no metal box visible; tuning is fine but slower than geared |
| **B. Modern metal hardware** | Geared open-frame tuners (like banjo or autoharp tuners), or planetary-geared pegs (Pegheds, Knilling Perfection) | Cleanest tuning stability; faster tuning; more "modern instrument" look; visible chromed/gold-anodized hardware |

**SAM-13-ROOT first-pass pick:** option A (zither pegs) — lower cost, easier sourcing, more visually consistent with the chang-tradition reference photo, and the wood-on-wood look pairs better with the new hull-side inlay program.

**Implication for SolidWorks:** the `Neck Face` sketch needs Φ6 mm holes (not Φ12 for tuner posts) at each `s_n_neck` position. Hole depth ~25 mm, slight downward angle (~5°) into the neck face for tuning leverage.

## Finial options

The top of the neck is one of the more open design decisions — it can read as a small functional cap, a sculpted terminal, or an ornamental feature. Options:

| Option | Description | Notes |
|---|---|---|
| **A. Plain wood terminal** | Simple darker-wood cap, mortise-and-tenon mounted | Matches the chang reference photo; lowest cost; visually quiet |
| **B. Brass/gold-tone flared cap** | Echoes BM 121198 fingerprint; small trumpet/funnel | Pulls toward the Ur lineage; brand-friendly hardware piece |
| **C. Slip-cast ornamental top** | Custom ceramic finial — bison head, Sumerian rosette, abstract Heifer Zephyr mark, or other; slip-cast in porcelain or stoneware, glazed | Most distinctive; ties to the slip-cast workflow already in the `instrument-maker-v4` toolkit; one-off variants per build possible |
| **D. Carved hardwood finial** | Sculpted bison head or geometric form in the neck wood | Matches all-wood aesthetic; no separate material; CNC-shapeable with a follow-up hand-carve pass |

**SAM-13-ROOT first-pass pick:** option C (slip-cast ornamental top) — uses the existing slip-cast workflow, allows one-off variation per build, and provides a natural placement for the Heifer Zephyr bison mark.

## Inlay program (Broinwood-style + hull sides)

Pair with the `laser-art` skill for the parametric inlay generation. Inlay locations across the instrument:

| Location | Inlay treatment | Notes |
|---|---|---|
| Soundboard-hull seam | **Multi-strip lapis-look band** (5 parallel strips with light spacers) | Matches BM lapis seam; visible from above |
| Bow end of soundboard | **Rectangular pale inlay panel** (mother-of-pearl or shell composite) | Frames the string-holder-strip area |
| Neck-body joint band | **Multi-strip wood inlay** (light/dark alternating, ~6 strips) | Matches chang reference photo |
| **Hull sides — new (2026-05-16)** | **Intricate CNC-routed inlay** running longitudinally along both hull sides | Major design feature added per Tony's expansion of the inlay program |
| Neck face decorative band | Optional — narrow longitudinal inlay between tuner row and back of neck | Optional accent |

**Hull-side inlay program (new):**
- Two longitudinal panels, one per hull side, running ~70% of body length centered on the boat's beam-line.
- Each panel ~30–40 mm wide × variable length, sized parametrically to `body_length_mm`.
- Suggested motif palette: cylinder-seal-style figural narrative (boat-and-water scene, banquet figures, abstract Sumerian linework), or geometric Sumerian rosettes scaled across the panel.
- CNC-route pockets in same setup as hull shaping; back-fill with shell, contrasting wood, brass wire, or dyed-epoxy.
- Pair with the `laser-art` skill specifically for the figural-narrative variant — laser-cut inlay pieces drop into CNC-routed pockets for clean registration.

**Implication for SolidWorks:** add `Hull_Side_Inlay_L` and `Hull_Side_Inlay_R` sketches on opposite faces of the hull, mirrored across the long-axis plane. Pocket depth ~1.5 mm, panel size driven by `body_length_mm` and a new `hull_inlay_coverage_pct` global variable.

Candidate motifs for any of the above panels:

- Sumerian cuneiform fragment — actual line from a known tablet, micro-routed.
- Cylinder-seal scene — Royal Tomb procession (the same source class the original reconstruction drew on).
- Boat-and-water linework — modern abstract referencing the form.
- Geometric Sumerian rosette pattern.

CNC inlay pockets are added to the MasterLayout sketches and propagate to soundboard, decorative neck band, and now the hull sides.

## SAM-25-CONCERT alternative aesthetic (2026-05-16)

The chang reference photo gives SAM-25-CONCERT a distinct visual identity from the BM-anchored SAM-13-ROOT. Locked SAM-25 choices:

| Feature | SAM-13-ROOT (BM lineage) | **SAM-25-CONCERT (chang lineage)** |
|---|---|---|
| Hull depth ratio | D/L = 0.31 (raised from BM) | **D/L = 0.40** (chang-proportioned, full hull) |
| Soundhole | Single oval keel-port (forward projection) | **Bow-end soundboard rose** (~50 mm dia round, near string-holder strip) — chang-style |
| Tuners | Zither pegs (matching family default) | Zither pegs (consistent) |
| Finial | Slip-cast bison/Heifer Zephyr mark | Slip-cast ornamental, possibly larger / more sculptural piece |
| Inlay bands | Multi-strip lapis seam + bow inlay panel | **Two multi-strip bands** — at neck-body joint AND at bow edge (matches chang reference); plus hull-side inlay |
| Cavity volume | ~10 L | **~56 L** |
| Voicing target | Intimate, focused | **Substantial, concert-room projection** |

SAM-25 is the concert-stage instrument; SAM-13-ROOT is the intimate-listening instrument. Both share the same MasterLayout parametric backbone — variant differences resolve at the design-table configuration level, not as separate parts.

## Acoustic study program (Wolfram)

See `wolfram/sambuca-acoustics-starter.wl` for the starter notebook. Sweep:

1. Hull internal volume (3 → 10 L) — covers all three family variants.
2. Soundboard species & thickness (Sitka / Engelmann / cedar / redwood × 2.5–4.0 mm).
3. Soundhole geometry (none / single keel oval / dual keel circles / soundboard rose).
4. String set (fluorocarbon / nylgut / gut / wound options).
5. String-holder strip mass, length, and exact bow-end position.

Outputs: predicted first cavity mode, first soundboard plate mode, voiced response across the full string range, recommended pickup placement.

## Resolved this session (2026-05-16)

| Question | Resolution |
|---|---|
| Tuning system for SAM-13-ROOT | **G-major (G3 → E5) locked as the build target.** A-major (A3 → F#5) documented as a drop-in retune string set, no neck modification required (covered in `supplier-rfq.md`). |
| Mirror-image preference | **Dissolved by the symmetric forward-facing playing position.** Long axis of the boat runs forward between the thighs; neck rises away from the torso; both hands access strings symmetrically. No L/R default-build SKU. |
| Bridge vs. tailpiece | **No bridge bar.** Strings terminate at a glued-on string-holder strip near the bow end of the soundboard (standard arched-harp practice). Strip position is a voicing decision on the SAM-13-MULE prototype, then committed on SAM-13-ROOT. See "String termination — no separate bridge bar" section above. |
| Pickup option | **SAM-13-AE is its own family-spec row.** Under-strip piezo transducer + 1/4" output jack hidden in stern stub. SAM-13-ROOT stays purely acoustic. |
| Brand integration | **Both placements proposed for review** (see "Brand integration — Heifer Zephyr" section in the v4 additions below). Final pick deferred to the cultural/brand review gate. |
| Wood pairing for SAM-13-ROOT | **Walnut hull / Western red cedar soundboard / Sapele neck.** Cedar is more responsive than spruce at low SPL — useful for the small 3.8 L cavity. Sapele neck is stiff enough for cantilever and matches walnut tonally. |
| Release window | **Fall 2026 capstone (~Oct–Nov).** Aggressive but workable if the MULE tension test happens early in the schedule. |

---

# v4 Build-Packet Updates (2026-05-16)

This section was added when the repo was handed to the `instrument-maker-v4` skill for the full build packet. Everything above is the design intake. Everything below is the build-target design lock for the SAM-13-ROOT prototype, with Pack-and-Go siblings for the other four family variants.

## v4 design intent

Deliver a buildable SAM-13-ROOT prototype, plus a parametric family that scales to the other four variants without re-engineering, plus a full documentation slate (BOM, sourcing, cut list, validation, assembly manual, capstone deck, print packet, build-log site) honest enough that a competent woodworker with CNC access could build it from the packet alone.

The build target is the **SAM-13-ROOT**: 650 mm body length, 13 strings, G-major (G3 → E5), walnut/cedar/sapele wood pairing, single keel soundport, brass neck-body collar, multi-strip lapis-look inlay band, rectangular pale inlay panel at the bow end of the soundboard, glued-on string-holder strip near the bow, integral stub feet at the stern keel, CNC-curve-profiled stand with Japanese-style joinery. Aimed at the Fall 2026 capstone window.

## Design refinements from the second photo set (2026-05-16)

The second photo set added five design implications that flow into the BOM, cut list, and drawing brief:

1. **Multi-strip lapis band.** The original is a parallel-strip band, not a single binding strip. Spec: 5 parallel strips × 1.5 mm wide × 0.8 mm spacer, total band width ~12 mm, depth 1.5 mm. Material: lapis-blue-dyed veneer with thin maple or holly spacers, set in epoxy. Routed in a single CNC inlay pass with a 0.8 mm or 1.0 mm end mill.

2. **Bow-end soundboard inlay panel.** Roughly 100 × 60 mm pale rectangular panel inset into the soundboard at the bow end (~82% from stern), framing the string-holder strip area. Material options: mother-of-pearl tile (expensive, period-correct), shell-look composite, dyed-and-polished maple burl, or pale-stone veneer composite. Pocket depth 1.5 mm to match band depth; CNC pocket cut in the same inlay setup.

3. **Stern stub feet — integral, not decorative.** Two carved hardwood stub blocks integral to the keel near the stern. Function: bench-rest support when set down; visual rhyme to the original. Spec: ~30 × 25 × 15 mm walnut blocks, glued and pinned to the keel from inside the hull. Position determined parametrically by stern centerline + `body_depth_mm`.

4. **Tuner cord-wrap fingerprint.** Each tuner = geared guitar tuner (hidden inside the neck) → wooden shaft + visible decorative cord wrap → PVD-gold-tone bulb cap. The cord wrap is a separate visible element below the cap, not decorative-painted onto the cap. Spec: aged-look waxed-silk or sinew-look cord, ~1 mm diameter, ~8 turns per peg. Listed in BOM as a separate hardware line.

5. **Pronounced bow lift.** Side-profile sketch should include 10–15° upward tangent rotation at the bow end of the keel, like a small skiff. Visible in the right-plane profile drawing.

The corresponding parameters were appended to `cad/SAM-000_master-equations.txt` in the multi-strip and bow-panel sections.

## Cultural provenance language (locked for public release)

This is the verbatim language the build packet will use in the public README, capstone deck, and build-log site. It is also the language that the cultural-advisor review gate will assess before public release.

> The sambuca pattern is rooted in early Mesopotamian (Sumerian) musical instruments from the Royal Cemetery at Ur, approximately 4500 years old. The pattern itself is unambiguously in the public domain — there is no living tradition with a claim on the form, no surviving lineage of practitioners, and the surviving artifact at the British Museum (object 121198) is itself a 1971–72 reconstruction of which only the gold tuning pegs and lapis lazuli decorations are original Sumerian material. The wood is interpretive.
>
> The Greek term *sambykē* (σαμβύκη) is a later (Hellenistic) word, historically debated as a possible descendant of the Sumerian form. This build adopts "sambuca" as the modern repo and brand term while acknowledging that the Hellenistic *sambykē* may or may not be a direct descendant; it is not a claim of identity with the Greek instrument.
>
> This build is **inspired by** the Sumerian pattern. It is **not**:
>
> - A reproduction of any specific surviving artifact.
> - A recreation of any reconstructed instrument such as BM 121198.
> - A claim of cultural authority over any modern living tradition.
> - A claim that the original sounded like this — we have no recordings of Sumerian music; tuning systems, voicing, and performance practice for the original are unknowable.
>
> Modern updates that depart from the pattern are called out explicitly in `design.md`: keel-port soundhole (not original), geared guitar tuners hidden behind decorative caps (not original — original tuners were peg-and-wrap), modern fluorocarbon/nylon strings (not original — original strings were gut or twisted sinew), Broinwood-style CNC inlay (modern parametric process applied to fingerprint motifs), CNC-cut hull and neck (modern fabrication), Japanese-style joinery on the stand (a stylistic choice, not a Sumerian element).

This language will appear in:

- Public README (replacing the current "Provenance & cultural notes" section).
- Capstone deck slide 2 ("Provenance & design freedom").
- Print packet appendix.
- Build-log site footer.

## Brand integration — Heifer Zephyr

Two placement options for the Heifer Zephyr wordmark + bison mark, both consistent with the Sumerian fingerprint program. Final pick deferred to the brand-integration review gate.

### Option A — Soundboard inlay placement

- Wordmark in italic-serif treatment inlaid into the soundboard, positioned just **stern of the string-holder strip** (i.e., toward the player), where the strings don't obscure it during play.
- Size: ~80 mm wide × 14 mm tall.
- Material: same multi-strip inlay technique as the lapis band — but in a contrasting hue (brass-leaf veneer + dark-walnut spacer, or pale boxwood veneer with copper inlay).
- Bison mark: ~25 mm diameter, set to the right of the wordmark.
- Pros: visible to player and audience during performance; integrated into the period inlay program; visually claims the build.
- Cons: makes the brand inseparable from the instrument; harder to remove if branding ever changes; player must see it during every practice session.

### Option B — Stand-only placement

- Wordmark + bison mark inlaid into the **base of the stand cradle**, visible when the instrument is displayed but invisible when the instrument is in playing position (cradle is behind/under the boat).
- Size: ~120 mm wide × 18 mm tall on the front of the cradle base.
- Material: lapis-style multi-strip inlay matching the boat's seam band.
- Pros: brand visible in display photos and storefront imagery; not visible during play, so the instrument feels less "branded" in performance; stands can be remade if brand evolves.
- Cons: brand absent from the playing instrument; loses visibility during live performance.

### Hybrid (recommended for capstone)

Run Option B for the SAM-13-ROOT prototype (the build-target), and document Option A as a SAM-13-ROOT-BRANDED configuration for future production runs. This keeps the prototype neutral enough that the cultural-advisor review can focus on the Sumerian-provenance language without the brand integration becoming a distraction.

## Workbook interpretation

This repo deliberately does **not** carry an .xlsx Master Design Sheet (the kora pattern uses one; the sambuca was switched to a .txt equations file at the SolidWorks-handoff layer). The design data lives in three files:

- `cad/SAM-000_master-equations.txt` — global equations for SolidWorks Equations Manager. The authoritative numeric definitions.
- `family-spec.csv` — the five-row family table that drives the SolidWorks design-table configurations.
- `wolfram/sambuca-acoustics-starter.wl` — acoustic-study parameters, derived where possible from the master equations.

If a downstream xlsx is needed (for example, for the v4 SolidWorks design-table sync workflow), use `scripts/generate_sw_design_table.py` from the instrument-maker-v4 skill against `family-spec.csv`.

## Expanded physics model

The acoustic system has four coupled stages. Each is modeled separately in `wolfram/sambuca-acoustics-starter.wl`; the combined response is the new section being added in Phase 4 of this packet build.

| Stage | Equation | What it tells us |
|---|---|---|
| **String** | `f = (1 / 2L) · √(T / μ)` | Tension and length for each of the 13 strings at the chosen G-major tuning. |
| **Cavity** | `f_axial ≈ c / (2L)` for closed-end, Helmholtz `f_H = (c/2π)·√(A / (V · L_eff))` for keel port | First longitudinal mode ~265 Hz (closed) / ~132 Hz (one-open); keel-port Helmholtz prediction ~143 Hz for the SAM-13-ROOT geometry. |
| **Plate** | Cantilever / Chladni mode estimator for the soundboard, `f_pl ∝ (h / L²) · √(E / ρ)` | First plate mode falls in the range where the lower-middle strings live — confirms cedar is acoustically reasonable for the small cavity. |
| **Coupled** | Two-coupled-oscillator approximation (cavity ↔ plate) | The Helmholtz peak + first plate mode split into a coupled pair; the lower of the two should sit just below the lowest bass string (G3 = 196 Hz) to enable the cavity-supported bass response. |

**Voice prediction.** The bass strings on SAM-13-ROOT (G3 = 196 Hz through about C4 = 261 Hz) fall near or just above the predicted coupled Helmholtz-plate pair. This is the *sweet spot* — strings just above the lowest resonance get good radiation. The middle strings live above the first plate mode and below several higher cavity modes; their response will be dominated by the soundboard's broader response. The top strings (above ~600 Hz) are above all relevant cavity modes; they will radiate mostly through high-frequency soundboard modes and direct string radiation.

## String tension calibration plan

The starter values in `cad/SAM-000_master-equations.txt` produce ~103 kgf total tension on SAM-13-ROOT vs. a target of 65–80 kgf. The plan to bring this down:

1. **First pass (low risk):** Use wound nylon (NOT plain fluorocarbon) for strings 1–4 (the bass quartet). Wound bass strings have substantially higher μ per unit diameter, so they hold pitch at lower tension. Predicted reduction: ~25 kgf off the bass quartet, total drops to ~78 kgf — inside target band.

2. **Second pass if needed:** Shorten `string_len_max_mm` from 580 → 520. Trims the bass range envelope; the lowest string still reaches G3 but with marginally lower projection. Predicted further reduction: ~8 kgf.

3. **Validation:** Confirm on the SAM-13-MULE build (which intentionally runs at 3.0–4.5 kgf/string to validate joint behavior at reduced load). MULE proves the neck-joint geometry works; ROOT runs at the full calibrated 65–80 kgf load.

Implementation lives in `supplier-rfq.md` (string set spec) and the `validation.csv` row for total tension.

## Public-release gates

This repo stays in **private review** until all three of the following close:

| Gate | Owner | What it produces |
|---|---|---|
| **Cultural / musicology advisor review** | external advisor | Sign-off (or red-line) on the cultural-provenance language above; acknowledgment of the Sumerian → *sambykē* etymological note; review of any imagery used in the build-log site for misappropriation concerns. |
| **SAM-13-MULE tension and joint validation** | Tony | Successful tension-up of the MULE to 50% of target load with no neck-joint deflection beyond predicted; no soundboard cracking; string-holder strip position empirically tuned. Documented in `validation.csv` and the build-log. |
| **Heifer Zephyr brand integration** | Tony | Pick between Option A (soundboard) and Option B (stand-only); placement spec locked; inlay program updated; capstone deck and print packet final brand artwork prepared. |

The site `index.html` and the public README open with a `PRIVATE REVIEW — pending [cultural review · MULE validation · brand integration]` banner until these close.

## Sources

- BM 121198 display card and gallery photos.
- BM 121198 second photo set (close-up + full-instrument + three-quarter view), Tony Koop direct upload, 2026-05-16.
- Herbology Manchester profile photo of BM 121198, 2015.
- Royal Cemetery cylinder seal B16728 / Penn Museum object 47880.
- Kora MasterLayout pattern, `C:\Users\Tony\Documents\GitHub\kora\cad\KOR-000_MasterLayout.xlsx`.
- Tony's stated design intent and resolved-this-session answers, 2026-05-16.

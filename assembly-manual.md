# Sambuca — Assembly Manual (SAM-13-ROOT build target)

Staged build method with hold points before full string tension. The critical hold point is the **MULE tension validation** before any production SAM-13-ROOT is strung to full load.

Estimated active build time: 60–90 hours over 6–10 weeks. Plus a 30-day MULE hold for tension validation.

> This manual covers the SAM-13-ROOT build target. SAM-19-MID and SAM-25-CONCERT follow the same sequence with `scale_factor` substitutions from `family-spec.csv` and the master-equations. SAM-13-AE adds the electronics stage between Stages 9 and 10. SAM-13-MULE is the same as SAM-13-ROOT but uses reduced-tension string set and is the validation precursor.

---

## Stage 0 — Pre-build (Week 1)

- [ ] Review `design.md`, `risks.md`, `cad/SAM-000_master-equations.txt`.
- [ ] Confirm wood pairing (walnut hull / cedar soundboard / sapele neck) — visually match the hull, stand, and stub-foot stock so they read as a single set.
- [ ] Place sourcing orders per `sourcing.csv`. PVD-gold-tone bulb caps (BOM-018) is the longest lead — start that first.
- [ ] Mock-fit one geared tuner sample into a neck-cross-section dummy. If `neck_depth_mm` is too tight, re-spec before cutting CUT-009.
- [ ] Build the fixtures from `cut-list.csv` CUT-201 through CUT-205: laminating jig, soundboard pull-test fixture, neck-deflection jig, string-holder-strip positioning fixture, soundboard inlay template.

**Hold point:** Do not cut production stock until the tuner fit check (R-X-04) is resolved.

---

## Stage 1 — Hull (Weeks 2–3)

Choose one of two hull paths per `cut-list.csv`:

### Path A — CNC-from-block (CUT-001a)

1. Load walnut billet (200 × 200 × 700 mm) onto CNC bed with vacuum chuck or machinable fixture.
2. First pass: rough hollow with 1/4 in 2-flute upcut, ~0.5 mm material left for finishing.
3. Second pass: finishing pass with 1/8 in ball mill, leaving `hull_wall_mm` = 6 mm wall thickness.
4. Flip and second-side: top-profile cut (soundboard rebate), keel-port pre-positioned but not cut through yet.
5. Remove from fixture; clean machining marks; verify wall thickness with calipers at three locations (V-D-03 dependency).

### Path B — Stave-laminated (CUT-001b)

1. Mill 10 walnut staves to 60 × 20 × 650 mm.
2. Bevel mating edges for the half-ellipsoid hull shape (compound miter math; reference the Top Profile and Side Profile sketches).
3. Bend and glue around a buck form (the buck is a one-time MDF fixture, similar to CUT-204 but for the hull).
4. Cure 48 hours under banding straps.
5. CNC clean-up pass on the laminated shell: final wall thickness, soundboard rebate, scarf-cut location.

> Both paths converge here. The remainder of the manual is hull-option-agnostic.

6. Glue the stern stub feet (CUT-004) to the keel interior near the stern. Two feet, ~30 × 25 × 15 mm walnut blocks, on either side of the keel centerline. Use Titebond III + clamping; cure 4 hours.

**Hold point:** Hull-wall thickness verified to 6 ± 0.5 mm at midship, bow, and stern. Stub feet glued and pinned. Hull is now ready for soundboard fitting.

---

## Stage 2 — Neck blank (Weeks 2–3, parallel with Stage 1)

1. Rip sapele to three 12 × 38 × 810 mm laminate strips (CUT-009).
2. Set up the laminating jig (CUT-204) to the `neck_curve_radius_mm` curve. Coat mating faces with Titebond III. Clamp the three laminates around the form.
3. Cure 24 hours minimum, ideally 48 hours.
4. Remove from jig. Final laminate dimensions ≈ 38 × 38 × 810 mm.
5. Mount on CNC fixture (custom curved fixture, may need 3-axis with rotary indexing).
6. Sweep CNC operation to produce the swept neck cross-section along the `Neck Curve Path`.
7. Cut the scarf at the neck base (CUT-012) — 8:1 scarf, 80 mm long.
8. Drill the tuner-mounting holes per the neck-face linear pattern (13 holes at `s_n_neck` arc-length distances from the joint reference, Φ12 mm).
9. Sand and pre-finish the neck.

**Hold point:** Neck blank is structurally complete. Tuner holes drilled. Scarf cut.

---

## Stage 3 — Soundboard (Week 3)

1. Plane / sand cedar QSAAA soundboard to final 3 mm thickness (CUT-005).
2. Glue light fan-brace pattern (4 cedar braces, 3 × 8 mm cross-section, radiating from where the string-holder strip will sit toward the inlay band — CUT-006). Use hot hide glue for reversibility; cure 4 hours.
3. CNC cut the multi-strip lapis pocket (CUT-023) along the soundboard-hull seam — 5 parallel passes with the 0.8–1.0 mm end mill.
4. CNC cut the bow-end inlay panel pocket (CUT-026) — 100 × 60 × 1.5 mm.
5. *Heifer Zephyr Option A only:* CNC cut the wordmark pocket (CUT-027) stern of the string-holder strip position.

**Hold point:** Soundboard is dimensioned, braced, and has all inlay pockets cut. Do not glue inlay yet.

---

## Stage 4 — Hull seam scarf joint and brass collar (Week 4)

1. Cut the hull mating scarf (CUT-013) at the stern (where the neck joins). Reciprocal of the neck scarf.
2. Dry-fit the neck scarf into the hull. Verify alignment along the body centerline.
3. Cut the brass collar tube (CUT-014) — 60 mm tall, slip-fit over the scarf joint.
4. Test-fit the brass collar over the dry-assembled scarf. Mark and drill the through-collar dowel hole (CUT-015).
5. Polish or chemically-age the brass collar per R-F-02 (do the side-by-side finish test on a sample first).
6. Disassemble. Apply epoxy to scarf faces. Re-assemble with the brass collar in position. Insert the stainless 6 mm pin through both members (CUT-016). Clamp.
7. Cure 24 hours.

**Hold point:** Neck and hull are now permanently joined. The scarf-and-collar joint is the most critical structural element — confirm V-J-01 visual check at 24 hours and again at 48 hours before stringing.

---

## Stage 5 — Soundboard installation (Week 4)

1. Dry-fit the soundboard into the hull's soundboard rebate.
2. Glue the soundboard to the hull with Titebond III around the entire seam. Clamp around the perimeter; cure 8 hours.
3. Once cured, glue the multi-strip lapis inlay strips into the band pocket (CUT-024 + CUT-025) — alternating lapis-blue veneer strips with holly/maple spacers per `inlay_strip_count`. Fill with tinted epoxy (BOM-012); scrape flush after cure.
4. Glue the bow-end inlay panel (BOM-007) into its pocket. Fill any seam with tinted epoxy; scrape flush.
5. *Heifer Zephyr Option A only:* glue the wordmark inlay into the soundboard pocket.
6. Sand entire soundboard flush; apply thin shellac or oil finish (BOM-037).

**Hold point:** Soundboard is sealed and inlaid. Do not install the string-holder strip yet — that is a voicing decision deferred to Stage 9.

---

## Stage 6 — Keel port (Week 5)

1. Mark the keel port position from `keel_port_x_from_bow_mm` and the centerline of the keel.
2. CNC or jigsaw the oval cut (CUT-018) — 80 × 50 mm major × minor. Cut at the `keel_port_forward_tilt_deg` chamfer angle (15°) to bias forward radiation.
3. Sand the port edges smooth.
4. *Optional:* fit the walnut binding strip (CUT-017) around the port perimeter. Steam-bend over a form to match the oval, glue with Titebond III.

**Hold point:** Keel port cut. If the keel-deflection check (V-S-03) shows concerning numbers in the Wolfram model, install the internal transverse braces (CUT-002 and CUT-003) fore and aft of the port now, while the soundboard is still off — but the soundboard is already on. **Decision point:** if braces are needed, cut access through the keel port. Otherwise skip.

---

## Stage 7 — Stand (Week 5, parallel)

1. CNC-curve-profile the two stand uprights (CUT-020) to match the keel curvature.
2. CNC-cut the stand base (CUT-021) — 275 × 120 × 60 mm walnut.
3. Cut the kanawa-tsugi key slots (CUT-022) where the uprights meet the base. The kanawa-tsugi joint exposes the keys on the front face.
4. Dry-fit. Adjust until the boat rests squarely on the cradle with the soundboard horizontal.
5. Glue the base assembly. Cure 4 hours.
6. *Heifer Zephyr Option B only:* CNC the wordmark pocket (CUT-028) in the front face of the stand base. Inlay matching lapis or contrasting material. Sand flush.
7. Apply oil + wax finish to the stand.

---

## Stage 8 — Tuners and decorative wraps (Week 6)

1. Install the 13 geared guitar tuners into the neck-face holes. Internal gear housing sits inside the neck; output shaft protrudes ~5 mm.
2. For each tuner, install the decorative cord wrap (BOM-019) at the base of the shaft — ~8 turns of waxed silk or sinew-look cord. Tie off cleanly.
3. Install the PVD-gold-tone brass bulb caps (BOM-018) over each tuner output shaft. Friction-fit with a small dab of epoxy on the inside to prevent rotation.
4. *Top of neck only:* install the gold cap finial at the top of the neck.

**Hold point:** All 13 tuners installed with caps and wraps visible. The visual fingerprint is now in place.

---

## Stage 9 — String-holder strip and prototype voicing (Week 7) [CRITICAL]

This stage is where the MULE-vs-ROOT validation distinction matters.

### For SAM-13-MULE (validation precursor)

1. Set the string-holder-strip positioning fixture (CUT-203) on the soundboard.
2. Glue the string-holder strip (CUT-007) at the initial position (`strip_x_from_stern_mm` = 80% of body length). Hide glue, reversible.
3. Install the **reduced-tension** MULE string set (3.0–4.5 kgf/string × 13 = ~50 kgf total).
4. Tune to standard pitch (G-major). Let settle 24 hours.
5. Measure SPL across the string range per V-A-01.
6. If voicing is wrong, *remove the strip* (hide glue softens with warm water and steam), reposition by 10–20 mm, re-glue, re-string, re-measure.
7. Iterate up to 3 strip positions across the bow band.
8. Lock the final SAM-13-MULE strip position. Record the offset from stern.

### For SAM-13-ROOT (production build)

1. Use the MULE-verified strip position. Glue the strip with hide glue.
2. Do NOT install strings yet. See Stage 10.

---

## Stage 10 — MULE tension validation and ROOT stringing [CRITICAL — public-release gate]

### MULE 30-day hold

1. SAM-13-MULE: tune to MULE spec (~50 kgf total).
2. Mount the neck-deflection jig (CUT-202 + BOM-043). Record dial indicator zero.
3. Hold for **30 days**.
4. Check dial indicator every 7 days for deflection.
5. **Pass criterion:** deflection ≤ 2 mm at the gold cap relative to the body (V-S-01). No audible creak. No glue-line separation (V-J-01).
6. If pass: proceed to SAM-13-ROOT stringing.
7. If fail: redesign the scarf-and-collar joint per R-S-01. Document failure mode.

### SAM-13-ROOT stringing

1. SAM-13-ROOT: install the calibrated full-tension string set (BOM-014 fluorocarbon trebles + BOM-015 wound nylon basses), targeting 65–80 kgf total.
2. Bring up tension **gradually** — 25% / 50% / 75% / 100% in steps of 24 hours each. Re-tune at each step.
3. At 100% tension, hold 7 days. Re-measure tension per V-T-02 and tuning stability per V-T-03.
4. If total tension exceeds 80 kgf, swap bass strings 1–4 to higher-μ wound stock or shorten `string_len_max_mm` per the calibration plan in `design.md`.

**Hold point — public-release-blocking:** V-S-01 (neck deflection) must pass on the MULE before any SAM-13-ROOT is brought to full tension.

---

## Stage 11 — Final voicing, acoustic measurement (Week 9)

1. Sweep frequency response on the SAM-13-ROOT per V-A-02. Confirm coupled cavity-plate pair signature in the 100–300 Hz band.
2. Measure Helmholtz frequency at the keel port per V-A-04. Should be ~143 ± 15 Hz.
3. Measure SPL at 1 m per V-A-01. Compare to Wolfram prediction; flag if more than 6 dB below.
4. 30-minute playing session ergonomic check per V-E-01. Document session length and posture.
5. Pre-performance harness check (SAM-25 only) per V-Z-01.

---

## Stage 12 — Documentation and brand integration (Week 10)

1. Capture photo set per `photo-shotlist.md`. Hero shots, detail shots, in-playing-position shots.
2. Update `validation.csv` with measured values.
3. Update the `wolfram/sambuca-acoustics-starter.wl` notebook with measured-vs-predicted comparison.
4. Submit `design.md` cultural-provenance section to advisor for V-C-01 review.
5. Lock Heifer Zephyr brand placement (Option A or B) per V-B-01.
6. Final QA: verify all `validation.csv` rows are complete with measured values or marked-as-deferred.

---

## Public-release gate checklist

Before flipping the repo from private-review to public:

- [ ] V-S-01 SAM-13-MULE neck-deflection 30-day hold passed.
- [ ] V-T-02 SAM-13-ROOT calibrated-tension target hit (65–80 kgf).
- [ ] V-C-01 Cultural-provenance advisor review signed off.
- [ ] V-B-01 Heifer Zephyr placement option locked.
- [ ] R-S-05 SAM-25 eyebolt pull-test passed (if SAM-25 is in scope for the release).
- [ ] All `validation.csv` cultural-category rows (V-C-01, V-C-02, V-C-03) closed.
- [ ] `site/index.html` private-review banner removed.
- [ ] `README.md` updated to public-release language.

## Build-log captures (for site/index.html)

Photograph progress at the end of each stage. The build-log site pulls images from `images/` and re-renders the timeline. Captions per `photo-shotlist.md`.

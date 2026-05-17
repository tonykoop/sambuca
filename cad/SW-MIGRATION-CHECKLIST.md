# SolidWorks Migration Checklist — Kora → Sambuca

**Context:** Pack-and-Go produced `SAM-000_MasterLayout.SLDPRT` and `SAM-000_SAMBUCA.SLDASM` in this folder, but the *internal* geometry, equations, and sketches are still kora-shaped. Pack-and-Go renames file references; it does **not** rewrite features. The migration below is the manual work in the SolidWorks UI.

Estimated time: 3–6 hours for an experienced SW user familiar with the kora part.

## Strategy

You have two reasonable paths:

| Path | Effort | When to use |
|---|---|---|
| **A. Rebuild from scratch** in a new part file, importing only the equation block and assembly-level decisions | 5–8 hrs | When the geometry differs so much that editing kora features is harder than starting clean. **Likely the right call here** because the kora is a hemispherical bowl + straight neck while the sambuca is an elongated half-ellipsoid + curved cantilever neck — almost no sketches survive the conversion. |
| **B. Edit the existing Pack-and-Go part** in place, reshaping each sketch | 3–6 hrs | When you want to preserve the design-table column structure and feature tree from kora. Risky because many sketches will need to be deleted and recreated anyway. |

**Recommendation: Path A.** Use the Pack-and-Go SLDPRT/SLDASM only as a structural template for the *feature naming scheme* and *design table column layout*. Build new sketches.

---

## Path A — Rebuild checklist

### 1. Open `SAM-000_MasterLayout.SLDPRT` and clear inherited geometry

In the FeatureManager design tree, delete these kora-specific features (they don't apply to a boat hull):

- `Side Profile` (kora's bowl side profile — replace with boat ellipsoidal profile)
- `Port_XZ_Angle`, `Port_YZ_Angle` (kora gourd-port angle planes — sambuca doesn't have these)
- `Eyebolt_Mid_Plane` (kora hand-post eyebolt — sambuca uses a stern eyebolt for harness; recreate at new location)
- `Sound_Hole` (kora soundboard hole — sambuca's hole moves to the **keel**, different face)
- `Neck Face` (kora's flat straight-neck face — sambuca needs a curved-neck face along a 3D path)
- `Neck_Slot` (kora neck-slot mortise — sambuca has a different neck-to-body joint)
- `Bridge_String_Holes` (kora bridge string holes — sambuca's bridge geometry differs, recreate)
- `Left_Handle`, `Handle Mid Plane` (kora hand-posts — sambuca has no hand-posts)
- `3DSketch1` (kora string-path 3D sketch — sambuca's string paths are different curves)

Keep:

- Top-level reference planes (Front, Top, Right) — orientation conventions stay.
- Any origin point conventions.

### 2. Clear all kora equations

`Tools → Equations` → select all → delete.

### 3. Paste new equations from `SAM-000_master-equations.txt`

Copy from this folder's `SAM-000_master-equations.txt`. Paste block by block into the Equations Manager. Order: anchor values first, then derived, then string schedule. SolidWorks will complain about unbound `D@Sketch` references until the new sketches exist — that's OK, just suppress the warnings until step 5.

### 4. Build the sambuca master sketches

In order:

#### 4a. `Side Profile` (new) — boat hull silhouette on the Right plane

- Drive `body_length_mm` and `body_depth_mm` from globals.
- Sketch: half-ellipse for the keel curve + flat soundboard top + slight upward bow lift at one end.
- Suggested entities: 2 construction lines (length axis, depth axis), 1 ellipse arc (keel), 1 line (soundboard), 1 short arc (bow lift, ~10–15° tangent rotation).
- Add 2 small stub-foot positions (from the Herbology photo evidence) as additional construction geometry.

#### 4b. `Top Profile` (new) — boat hull plan view on the Top plane

- Drive `body_length_mm` and `body_width_mm` from globals.
- Half-ellipse in plan (pointed bow, rounded stern, or matched soft ends — design choice).

#### 4c. `Boat Hull Loft` or `Sweep`

- Loft the hull surface between the Side Profile and Top Profile sketches, or sweep an ellipse along the boat-length spine.
- Apply `hull_wall_mm` thickness as a shell or thin feature.

#### 4d. `Neck Curve Path` (3DSketch) — curved cantilever centerline

- Anchor at the neck-body joint (stern end of soundboard, per BM/Herbology evidence).
- Arc through `neck_arc_length_mm` with `neck_curve_radius_mm` as the bend radius.
- Lean back by `neck_lean_deg`.
- Terminate at the gold cap location.

#### 4e. `Neck Cross-Section` (sketch on a plane normal to the start of the Neck Curve Path)

- Rectangle: `neck_width_mm` × `neck_depth_mm`.
- Sweep along the Neck Curve Path to generate the neck body.

#### 4f. `Neck Face` (sketch on the front face of the swept neck)

- This is where the tuning peg positions live.
- Pattern: 13 instances (driven by `string_count`), spaced by the `s1_neck` through `s13_neck` arc-length distances from the joint reference.
- Each instance is a Φ12 mm circle representing a tuner mounting point.
- Bind via design table or equation: `D6@Neck Face = s1_neck`, etc., per the kora pattern.

#### 4g. `String_Holder_Strip` (sketch on the soundboard top face)

**No raised bridge bar** — the sambuca follows arched-harp practice. Strings terminate directly at the soundboard via a glued-on string-holder strip.

- Position: `strip_x_from_stern_mm` from the stern (~80% along the body, near the bow).
- Length: `strip_length_mm`, centered transversely on the soundboard.
- Cross-section: `strip_width_mm` × `strip_thickness_mm`.
- 13 tie-through holes patterned along the strip, spacing `string_spacing_mm`, diameter `tie_hole_dia_mm`.
- Material in BOM: walnut, maple, or rosewood — separate piece glued to soundboard.
- *Prototyping note:* design as a glue-on-later strip so the position can be tuned during initial voicing. Hide glue for reversibility.

#### 4h. `Keel Soundport` — on the bottom (keel) face of the hull, not the soundboard

- Position: `keel_port_x_from_bow_mm` from the bow.
- Geometry: oval, `keel_port_long_mm` × `keel_port_short_mm`.
- Cut feature with `keel_port_forward_tilt_deg` chamfered angle to bias forward radiation.

#### 4i. `Stern Eyebolt` — small reference plane + mounting hole near the stern

- Center on stern centerline, ~25 mm above keel.
- Φ6 mm through-hull for M6 stainless eyebolt (harness mount).
- Add 10 × 25 × 40 mm interior hardwood backing-plate sketch.

#### 4j. `Neck-Body Joint Collar`

- Annulus on the outside of the joint area, height = `joint_collar_height_mm`.
- Material: brass collar (visual fingerprint matching the original gold collar).

#### 4k. `Inlay Band`

- 3D sweep along the perimeter of the soundboard-hull seam.
- Cross-section: `inlay_band_width_mm` wide × `inlay_band_depth_mm` deep pocket.

### 5. Rebuild & verify equations bind cleanly

`Ctrl-Q` (full rebuild). Resolve any remaining unbound `D@…` references by going into Equations and matching them to your new sketch dimensions.

### 6. Set up the family design table

Insert → Design Table → Auto-create.

Configurations: `SAM-13-ROOT`, `SAM-19-MID`, `SAM-25-CONCERT`, `SAM-13-AE`, `SAM-13-MULE` (matching `family-spec.csv`).

Driving columns: `body_length_mm`, `body_width_mm`, `body_depth_mm`, `string_count`, `f_min_hz`, `f_max_hz`, `string_len_max_mm`, `string_len_min_mm`.

Note: the `s1_neck` through `s25_neck` variables expand as `string_count` grows. The cleanest pattern is to define `s14_neck` through `s25_neck` equations in the global block always-on, and have the SAM-13 configuration suppress the strings-14-through-25 features.

### 7. Save the assembly

Open `SAM-000_SAMBUCA.SLDASM`. The assembly will need its mate references updated when the MasterLayout part rebuilds. Re-mate as needed.

### 8. Export design-table dimensions for documentation

Once the model rebuilds cleanly across all configurations, export the design-table values to CSV:

`File → Export → Configurations → Export Design Table → CSV`

Save the result as `SAM-000_Sambuca_ALL_CONFIGS_dimensions.csv` (mirrors the kora `KOR-000_KoraHarp_ALL_CONFIGS_dimensions.csv` pattern). This CSV becomes one of the deliverables to instrument-maker-v4.

---

## Path B — Edit-in-place checklist (if you choose this path instead)

In short: don't. The geometric transformation from kora (bowl + straight neck) to sambuca (boat + curved neck) replaces almost every sketch in the tree. Path A (build clean) is faster.

If you must:

1. Open `SAM-000_MasterLayout.SLDPRT`.
2. Edit the kora `Side Profile` sketch: delete the circle/bowl geometry, replace with the boat side profile. **Most existing equations referencing `D2@Side Profile`, `D3@Side Profile`, etc., will break** because the dimension IDs change when you reshape the sketch.
3. Repeat for every sketch in §1 above. By the time you've reshaped 8 sketches, you've effectively rebuilt — but with broken equation history fighting you the whole way.

---

## Verification before declaring SW work complete

- [ ] Part rebuilds with no errors across all 5 configurations in the design table.
- [ ] Changing `body_length_mm` from 650 → 850 → 1050 produces a recognizable boat in each case.
- [ ] Changing `string_count` from 13 → 19 → 25 spawns the right number of tuning peg locations.
- [ ] Total instrument height matches `instrument_height_mm` ± 5 mm in each configuration.
- [ ] Keel soundport visible on the bottom of the hull, not the top.
- [ ] No floating handle / hand-post features inherited from kora.
- [ ] Assembly file opens with no missing-reference errors.

## When you're stuck

If a step in this checklist isn't working in your SolidWorks version, paste the FeatureManager tree and the error message into a fresh chat with the `instrument-maker-v4` skill loaded — that skill has the parametric-design know-how to debug.

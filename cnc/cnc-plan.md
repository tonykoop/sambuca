# Sambuca — CNC Operation Plan

Pre-CAM operation graph, datum strategy, tooling, workholding, and check gates. This is **not G-code** — it's the human-readable plan a CNC operator works from before any CAM software touches the model.

> Conventions: all setups reference the MasterLayout datums (A: soundboard top face at stern centerline; B: body centerline long axis; C: keel centerline). Machine assumed to be a 3-axis CNC router with at least 800 × 400 × 200 mm work envelope (Maker Nexus Shopbot or equivalent).

## Operation graph — SAM-13-ROOT

```
Hull (CUT-001a OR CUT-001b)  ─┐
                              ├─► Hull seam scarf (CUT-013)  ─┐
Neck blank (CUT-009 → CUT-011)─┤                              │
                              │                              ├─► Scarf assembly + brass collar (CUT-014, 015, 016)
Soundboard panel (CUT-005)  ──┤                              │
                              └─► Soundboard inlay (CUT-023, 024, 025, 026)
                                                              │
                                                              ▼
                                  Soundboard glue-in to hull
                                                              │
                                                              ▼
                                  Keel port (CUT-018)
                                                              │
                                                              ▼
                                  String-holder strip placement (CUT-007)
                                                              │
                                                              ▼
                                  Stand (CUT-020, 021, 022) ──► Final assembly
```

## Operation 1 — Hull, CNC Path A (CUT-001a)

| Field | Value |
|---|---|
| Stock | Walnut billet 700 × 200 × 200 mm |
| Setup | One setup; vacuum chuck + outboard machinable fixture if vacuum insufficient |
| Datum | DATUM A on the soundboard side (face up at setup); DATUM B = billet long axis |
| Tooling | 1/4 in 2-flute upcut (Onsrud 60-103 or equiv) for roughing; 1/8 in ball mill for finishing; 1/2 in surfacing bit for soundboard rebate |
| Operations | (1) Surface top to flatness 0.1 mm. (2) Pocket soundboard rebate per `body_width_mm` × `body_length_mm` × 4 mm depth. (3) Outline hull profile (top view) with 1/4 in upcut leaving 1 mm. (4) Hollow keel from below — requires flip + second setup OR pre-pocket from soundboard side. (5) Finish pass at 0.05 mm step-over with ball mill. (6) Pre-position keel port cut (do not cut through yet — done in Operation 7). |
| Workholding | Vacuum chuck on the soundboard face for hollowing; outboard clamps for profile cut |
| Feeds and speeds | Roughing: 200 IPM, 18000 RPM. Finishing: 80 IPM, 18000 RPM. Tune to actual stock. |
| Inputs from master-equations | `body_length_mm`, `body_width_mm`, `body_depth_mm`, `hull_wall_mm` |
| Outputs | Hollowed hull, soundboard rebate, hull profile cut |
| Release checks | (1) Wall thickness 6 ± 0.5 mm at midship / bow / stern (3 caliper points). (2) Soundboard rebate is flat to 0.1 mm. (3) No spelched grain on the outside. (4) Hull weighs ~700 g ± 50 g (planning estimate). |
| Risks | R-S-04 soundboard collapse if rebate is uneven; R-S-03 keel port stiffener decision deferred to Operation 7 |

## Operation 1B — Hull, CNC Path B post-glue-up (CUT-001b)

| Field | Value |
|---|---|
| Stock | Stave-laminated walnut shell after glue-up around buck |
| Setup | One setup; the stave shell mounted in its buck-form fixture |
| Datum | DATUM A and B established on the glue-up; verify before machining |
| Tooling | Same as Path A but with shallower depth-of-cut |
| Operations | (1) Surface soundboard rebate. (2) Profile bow and stern trim. (3) Final wall thickness equalization at 6 mm. |
| Workholding | Buck fixture from stave-glue-up |
| Notes | Stave-laminated hulls usually need less CNC removal because the staves are pre-shaped. The CNC is for finish-pass + rebate consistency. |

## Operation 2 — Internal hull braces (CUT-002, CUT-003)

| Field | Value |
|---|---|
| Stock | Cherry 6 mm × 12 mm × 200 mm strips |
| Setup | Simple miter cut; no CNC needed |
| Tooling | Table saw or miter saw with fine-tooth blade |
| Operations | Crosscut to 180 mm. Round one face to match keel internal curvature (optional — bandsaw + sand). |
| Outputs | Fore and aft hull braces, ready to glue into the keel interior |
| Release checks | Fit-check inside hull; no rocking |

## Operation 3 — Stern stub feet (CUT-004)

| Field | Value |
|---|---|
| Stock | Walnut offcut from CUT-001 |
| Setup | Bandsaw + drum sander |
| Operations | Cut 2 blocks at 30 × 25 × 15 mm. Soft-radius the corners to match aesthetic of the original BM stub blocks. |
| Outputs | Two stub feet, ready to glue |

## Operation 4 — Neck blank CNC sweep (CUT-011)

| Field | Value |
|---|---|
| Stock | Glued 3-laminate sapele blank from CUT-010, cured 48 hr in laminating jig |
| Setup | Custom curved fixture. The fixture is a 1:1 mold of the underside of the neck curve. |
| Datum | DATUM at the scarf-joint base of the neck (will become the joint reference plane in SolidWorks) |
| Tooling | 1/4 in 2-flute upcut for stock removal; 1/8 in ball mill for the swept cross-section finish; small drill for the 13 tuner holes |
| Operations | (1) Mount the cured neck blank in the curved fixture. (2) Sweep CNC operation produces the curved cross-section per `neck_width_mm` × `neck_depth_mm`. (3) Cut the scarf at the base — 8:1 angle. (4) Drill 13 tuner-mounting holes (Φ12 mm) at `s_n_neck` arc-length distances from the joint reference. |
| Workholding | Custom curved fixture, vacuum-clamped or screw-clamped from below |
| Inputs from master-equations | `neck_arc_length_mm`, `neck_curve_radius_mm`, `neck_width_mm`, `neck_depth_mm`, `s1_neck`...`s13_neck` |
| Outputs | Finished neck blank with scarf joint and tuner holes |
| Release checks | (1) Neck arc length 710 ± 5 mm. (2) Cross-section 38 × 38 to 38 × 50 mm along the arc. (3) Tuner holes within 0.3 mm of `s_n_neck` positions. (4) Scarf face is flat to 0.05 mm. |
| Risks | R-S-01 — this is the cantilever member; defects here cascade into the structural failure mode |

## Operation 5 — Soundboard inlay pockets (CUT-023, CUT-026)

| Field | Value |
|---|---|
| Stock | Cedar soundboard panel, planed to 3 mm thickness |
| Setup | Vacuum table or low-tack double-sided tape on a flat MDF reference |
| Datum | DATUM A on the soundboard top face; DATUM B on the body centerline |
| Tooling | 0.8–1.0 mm 2-flute solid carbide end mill for the multi-strip pocket; 1/8 in end mill for the bow-panel pocket and wordmark pocket |
| Operations | (1) Cut the multi-strip lapis band pocket along the soundboard-hull seam — **5 parallel passes** at 1.5 mm width and 0.8 mm spacer, depths to 1.5 mm. (2) Cut the bow-end inlay panel pocket — 100 × 60 × 1.5 mm. (3) *If Heifer Zephyr Option A:* cut the wordmark pocket stern of the string-holder strip position, 80 × 14 × 1.5 mm. |
| Workholding | Vacuum or tape; cedar is light and warps easily, so don't over-clamp |
| Inputs from master-equations | `inlay_band_width_mm`, `inlay_band_depth_mm`, `inlay_strip_count`, `inlay_strip_width_mm`, `inlay_strip_gap_mm`, `bow_panel_length_mm`, `bow_panel_width_mm`, `bow_panel_depth_mm`, `bow_panel_x_from_stern_mm` |
| Outputs | Soundboard with all inlay pockets cut, ready for inlay material |
| Release checks | (1) Each lapis strip pocket is 1.5 ± 0.2 mm wide. (2) Total band width 11–13 mm. (3) Bow-panel pocket depth 1.5 ± 0.1 mm. (4) Pocket bottoms are flat (no tool-deflection wobble per R-F-01). |
| Risks | R-F-01 multi-strip tolerance; R-X-01 lapis stock availability |

## Operation 6 — String-holder strip drilling (CUT-007 + 13 tie-through holes)

| Field | Value |
|---|---|
| Stock | Walnut or hard maple, 10 × 4 × 150 mm |
| Setup | Double-sided tape on flat MDF for CNC, or drill press with positioning fence |
| Tooling | 1.5 mm drill bit (matches `tie_hole_dia_mm`) |
| Operations | (1) Drill 13 holes at `string_spacing_mm` spacing along the strip centerline. (2) Trim strip to 120 mm length (or scaled length for SAM-19/SAM-25 per `scale_factor`). |
| Inputs from master-equations | `strip_length_mm`, `strip_width_mm`, `strip_thickness_mm`, `string_spacing_mm`, `tie_hole_dia_mm` |
| Outputs | String-holder strip ready for hide-glue mounting on the soundboard during Stage 9 voicing |
| Release checks | Hole spacing ±0.2 mm; hole diameter 1.5 ±0.1 mm |

## Operation 7 — Keel port cut (CUT-018)

| Field | Value |
|---|---|
| Stock | Assembled hull with soundboard already glued |
| Setup | Hull mounted upside-down in cradle fixture |
| Tooling | 1/8 in 2-flute downcut for cleanest top-edge finish, OR jigsaw + sanding if CNC access is hard |
| Operations | (1) CNC or hand-mark oval cut at `keel_port_x_from_bow_mm`. (2) Cut oval at `keel_port_long_mm` × `keel_port_short_mm`. (3) Chamfer the cut at `keel_port_forward_tilt_deg` (15° forward tilt). |
| Inputs from master-equations | `keel_port_long_mm`, `keel_port_short_mm`, `keel_port_x_from_bow_mm`, `keel_port_forward_tilt_deg` |
| Outputs | Hull with keel port cut, soundboard intact |
| Release checks | (1) Oval major 80 ± 1 mm, minor 50 ± 1 mm. (2) Chamfer angle 15 ± 3°. (3) No cracks propagating from the cut edge. |
| Risks | R-S-03 keel-port vs stiffener — if Wolfram analysis flags concern, install internal braces (Operation 2) through this port access |

## Operation 8 — Stand uprights and base (CUT-020, CUT-021, CUT-022)

| Field | Value |
|---|---|
| Stock | Walnut 8/4 for uprights, 12/4 for base |
| Setup | Two setups: uprights first, then base |
| Tooling | 1/4 in 2-flute for profile; 1/8 in ball mill for final curve finish; kanawa-tsugi key cut with 1/8 in end mill or hand chisel |
| Operations | (1) CNC-curve-profile two uprights to match keel curvature. (2) CNC the stand base. (3) Cut kanawa-tsugi key slots where the uprights meet the base. |
| Inputs from master-equations | `stand_height_mm`, `stand_upright_count`, `stand_joint_style` (text-only) |
| Outputs | Stand parts ready to assemble |
| Release checks | (1) Uprights mate squarely with the keel curve at midship and stern. (2) Kanawa-tsugi keys slide in firmly with no gap. |

## Tooling list (consolidated)

| Tool | Use | Source |
|---|---|---|
| 1/4 in 2-flute upcut (Onsrud 60-103) | Hull roughing, profile cuts | Maker Nexus inventory or Onsrud |
| 1/8 in ball mill | Hull finishing pass, stand profile | inventory |
| 1/2 in surfacing bit | Hull soundboard rebate | inventory |
| 0.8–1.0 mm 2-flute end mill | Multi-strip lapis band | order per BOM-039, keep spare per R-F-01 |
| 1.5 mm drill bit | String-holder tie-through holes | Drill index |
| Φ12 mm drill or end mill | Tuner mounting holes | inventory |
| 1/8 in downcut | Keel-port cut (clean top edge) | inventory |

## Workholding summary

| Operation | Workholding |
|---|---|
| Hull Path A | Vacuum chuck + machinable fixture |
| Hull Path B | Stave buck-form fixture (one-time) |
| Neck sweep | Custom curved fixture (one-time) |
| Soundboard inlay | Vacuum table or low-tack tape |
| String-holder strip | Double-sided tape on MDF |
| Keel port | Hull cradle fixture (upside down) |
| Stand | Standard CNC clamps |

## Pre-CAM checks (before any G-code is generated)

- [ ] Master-equations file rev locked.
- [ ] SolidWorks model rebuilds across all 5 configurations.
- [ ] Custom fixtures (laminating jig, hull cradle, stave buck) designed and either built or queued.
- [ ] Tooling on-hand or ordered with lead time inside the build schedule.
- [ ] Stock material on-hand and quality-checked (no critical knots in the visible hull faces).
- [ ] Pre-build R-X-04 tuner mock-fit confirms `neck_depth_mm` accommodates the chosen tuner housing.

> When CAM software is ready to consume the SolidWorks model, this plan tells the CAM operator the order, datums, tools, and check points. Actual G-code is generated by Fusion CAM, V-Carve, or similar — not by this packet.

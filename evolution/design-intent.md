# Design Intent — sambuca rev A

- Master CAD: `cad/sambuca.scad` (sha256: cf2d314c533a4bddbcf8b2ffe1b48a0dfc7d5da1d9ebf9d0d82b034c7232cf1e), parametric envelope driven by `cad/SAM-000_master-equations.txt` (sha256: 34cb2ca18cda49dccca01b54ee9aa98b362bb1b7f2195e4d724af8bf136173d5) and `family-spec.csv`. SolidWorks MasterLayout remains kora Pack-and-Go inherited geometry pending rebuild — NOT dimensional authority.
- Function: Modern boat-shaped arched harp (sambuca) reinterpreting British Museum object 121198 (Royal Tombs at Ur, c. 2600 BC). A CNC-routed walnut boat hull with a laminated-bend sapele curved cantilever neck; the string load resolves as a horizontal pull at the neck head, carried through a brass-collared scarf joint into the hull. Western red cedar soundboard (~3 mm) with light fan bracing; single oval keel-port soundhole projects forward. Root build SAM-13-ROOT: 13 strings, G3→E5 diatonic; family scales to 19- and 25-string concert members.
- Environment: indoor plucked instrument; solid-wood hull/soundboard and mixed brass hardware move with humidity and temperature (brass collar seasonal-gap risk, R-S-02). Sustained string pull (~65–80 kgf total at ROOT) is a structural load on the neck joint.
- Target qty: 1 (SAM-13-ROOT prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Body length | 650 mm / 25.591 in (SAM-13) | family scale_factor = length/25.591 | sets whole-family scaling | family-spec.csv / master-equations.txt body_length |
| Body depth (D/L ratio) | 200 mm / 7.874 in (D/L ~0.31) | measured on build | cavity volume + acoustic voice (R-A-01) | family-spec.csv / master-equations.txt body_depth |
| Neck arc length | instrument_height − body_depth + 1.969 in | jig/template check | neck head height sets string tension geometry | master-equations.txt neck_arc_length |
| Total string tension | 65–80 kgf (ROOT); MULE 3.0–4.5 kgf/string | measured at tuning | neck-joint bending moment / cantilever survival (R-S-01) | family-spec.csv target_tension / risks.md R-S-01 |
| Soundboard thickness | ~3 mm / 0.118 in cedar | deflection + pull-test gate | structure vs. tone (R-S-04) | master-equations.txt soundboard_thickness |
| String spacing at strip | strip_length / (string_count + 1) | dry-fit gate | playability | master-equations.txt string_spacing formula |
| Keel-port size + position | 3.150×1.969 in oval @ 55% length | beam-analysis gate | soundhole vs. keel stiffness (R-S-03) | master-equations.txt keel_port block |

## Incidental (free for DFM)

- Hull-side longitudinal inlay motif and coverage styling, lapis-strip band cosmetics, bow-panel inlay pattern, finial form, non-mating surface finish, stand/cradle styling.

## Must-nots (DFM may never violate)

- Do not escalate to full ROOT tension before the SAM-13-MULE reduced-tension validation clears (≤2 mm neck deflection over 30 days) — risks.md R-S-01.
- Do not thin the soundboard below the validated 3 mm cedar or omit fan bracing under the string-holder strip — risks.md R-S-04.
- Do not cut the keel port without the fore/aft internal brace decision from beam analysis — risks.md R-S-03.
- Do not treat the kora-inherited SolidWorks geometry (or this OpenSCAD envelope) as fabrication authority — master-equations.txt is the dimensional source of truth; measured template still required.
- Do not publish provenance language before cultural-advisor review (open release gate).

## Material intent

- Preferred: CNC-routed walnut boat hull; laminated-bend sapele neck; western red cedar soundboard; brass neck collar; zither pegs (wood-bodied steel-hex-tip) for SAM-13; fluorocarbon-treble + wound-nylon-bass string set (per bom.csv / README).
- Acceptable subs: stave-laminated hull alternative; modern geared tuners as documented alternate; per sourcing.csv (planning prices, not live-verified).
- Forbidden: none recorded (cultural-provenance language gated, not a material).

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run. Three release gates remain open: SAM-13-MULE tension/joint validation, cultural-advisor review, Heifer Zephyr brand integration. Nothing presented as shippable.

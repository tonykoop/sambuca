# MCP Session Log — sambuca

The V5 refresh pass authored a parametric OpenSCAD envelope from the
authoritative global equations and ran an OpenSCAD render check. All other
artifacts remain hand-authored planning documents (see
`../visual-output-register.csv`).

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
|---|---|---|---|---|---|---|---|
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | cad/SAM-000_master-equations.txt, family-spec.csv | cad/sambuca.scad | cad_authoring | pending_measurement | self_checked | Parametric boat-hull/neck envelope; every nominal traces to master-equations.txt (inches) + family-spec.csv variants. OpenSCAD render check: pass (openscad -o STL, exit 0). Does NOT supersede the SolidWorks MasterLayout rebuild; not fabrication authority. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | cad/SAM-000_master-equations.txt, family-spec.csv | bom.csv, cut-list.csv, validation.csv | packet_refresh | reference_only | self_checked | V5 refresh pass; tabular packet data reviewed against master-equations single-source-of-truth. No dimension changes made. |

When an MCP or creative-tool session runs, add a row here before committing the outputs.

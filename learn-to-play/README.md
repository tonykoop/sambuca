# learn-to-play/ — placeholder

This folder will hold the starter songbook for the sambuca SAM-13-ROOT once the tuning system is locked.

## Status

- ⬜ **Locked:** G-major build target, G3 → E5 diatonic, 13 strings.
- ⬜ **Pending:** the SAM-13-MULE voicing pass that determines the exact string-holder strip position. The tuning is locked, but the speaking lengths shift slightly when the strip position is finalized.
- ⬜ **Pending:** A-major drop-in retune string set (documented in `supplier-rfq.md` as Set B). The learn-to-play folder will get a sibling sub-folder for A-major once the G-major songbook is in place.

## Population plan

Once the MULE clears Stage 9 (string-holder strip position locked) and the SAM-13-ROOT is strung to calibrated tension, hand off to the `sheet-music` skill. The skill knows the sambuca's family layout and can populate this folder following the kora repo's pattern:

- `00-warmup-scales/` — practice scales for the G-major tuning (G major, E minor pentatonic, modal exercises).
- `01-easy/` — entry-level pieces tied to single-octave fingerings.
- `02-intermediate/` — full-range pieces using bass cross-thumb technique.
- `03-original/` — original compositions for the sambuca; candidate first piece: "Heifer Zephyr" themed tune commissioned per the brand-integration gate.

Each piece gets:

- `notes.md` — playing notes, fingering, tempo, character.
- `score.abc` or `score.ly` — ABC or LilyPond source.
- `score.pdf` — rendered sheet music.
- `score.midi` — MIDI rendering for practice.

## Cross-reference

- Tuning anchor: `cad/SAM-000_master-equations.txt` (the `f1_hz` through `f13_hz` block).
- Family-spec: `family-spec.csv` (drives variant-specific songbooks).
- Skill: `sheet-music` (Anthropic skill registry; pairs with `instrument-maker-v4`).

## Not yet

Nothing buildable lives in this folder yet. Re-run with the `sheet-music` skill after the MULE Stage 9 voicing clears.

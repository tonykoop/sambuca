# Instrument-Maker-v4 Handoff Prompt

Paste the block below into a fresh Cowork session to kick off the full build packet for the sambuca via the `instrument-maker-v4` skill.

---

## The prompt (copy from here)

> /instrument-maker-v4
>
> I want to build the **full v4 instrument packet** for the **sambuca** — a modern boat-shaped arched harp inspired by the Royal Cemetery of Ur (~2600 BC). The reverse-engineering phase is complete; the repo is at `C:\Users\Tony\Documents\GitHub\sambuca\`. Treat that repo as the canonical design input.
>
> **Read first, before doing anything else:**
> - `C:\Users\Tony\Documents\GitHub\sambuca\README.md` — project intro and packet map.
> - `C:\Users\Tony\Documents\GitHub\sambuca\reverse-engineering.md` — locked taxonomy (boat-shaped arched harp, NOT a lyre), BM 121198 anchor dimensions, fingerprint elements, design freedom map.
> - `C:\Users\Tony\Documents\GitHub\sambuca\design.md` — soundhole-at-keel rationale, neck-joint trade study, harness logic for larger variants, Broinwood inlay program.
> - `C:\Users\Tony\Documents\GitHub\sambuca\family-spec.csv` — five planned variants (SAM-13-ROOT, SAM-19-MID, SAM-25-CONCERT, SAM-13-AE, SAM-13-MULE).
> - `C:\Users\Tony\Documents\GitHub\sambuca\cad\SAM-000_master-equations.txt` — global equations driving the parametric model. **Note the tension calibration warning** in that file (starter ramp produces 103 kgf total on SAM-13; target is 65–80; adjust diameters or bass material).
> - `C:\Users\Tony\Documents\GitHub\sambuca\cad\SW-MIGRATION-CHECKLIST.md` — current SolidWorks state and Path A rebuild plan.
> - `C:\Users\Tony\Documents\GitHub\sambuca\wolfram\sambuca-acoustics-starter.wl` — acoustic study starter.
> - `C:\Users\Tony\Documents\GitHub\sambuca\harness\README.md` — harness designs for the larger family variants.
> - `C:\Users\Tony\Documents\GitHub\kora\` — pattern reference; use its packet map as the structural template since I asked you to follow kora's pattern, not the conga/fujara variant.
>
> **Build the full root-mode v4 packet, mirroring the kora repo:**
> - `design.md` — extend the existing one with v4 design intent, workbook interpretation, physics model, cultural provenance language (Sumerian pattern, 4500 years public domain, **not** a claim against any modern living tradition).
> - `bom.csv` — make/buy materials and hardware with planning-estimate cost flags. Cover all five family variants where they differ.
> - `sourcing.csv` — spec-first table; do **not** verify live prices, flag the assumption.
> - `cut-list.csv` — rough and final dimensions for the boat hull (stave-laminated or CNC-from-block — propose both options), curved neck (laminated bend then CNC), brass collar, bridge, keel-port surround, stern eyebolt backing plate, stand, fixtures, templates.
> - `validation.csv` — dimensional, string-tension, acoustic, joint-strength, safety, and cultural checks. Include the bridge-position decision (Reading A tailpiece vs. Reading B bow-side bridge) as an explicit validation step on the prototype.
> - `assembly-manual.md` — staged build method with hold points before full string tension. Critical: a tension-up checkpoint before the final 13-string installation.
> - `risks.md` — red-team concerns. Top items I expect to see: neck cantilever failure under full tension, brass-collar mixed-material seasonal movement, keel-port placement vs. structural keel stiffener, harness rated-load for SAM-25.
> - `supplier-rfq.md` — RFQ drafts for wood, brass, strings, tuners (geared guitar-style hidden behind gold-tone caps), lapis-lazuli-look composite or dyed-veneer-and-epoxy inlay stock, harness hardware.
> - `drawing-brief.md` and `visual-bom-brief.md` — drawing and visual asset list.
> - `wolfram/sambuca-acoustics-starter.wl` — extend the existing notebook with soundboard plate-mode estimator and combined cavity × plate response.
> - `photo-shotlist.md` — shop and documentation shots.
> - `capstone-deck.md` and `capstone-deck.pptx` — full presentation outline + slides. Cover: history (BM 121198, Pu-abi's tomb, Royal Cemetery), design freedom argument, family spec, parametric SolidWorks workflow, acoustic study results, build sequence, finished prototype.
> - `capstone-manifest.json` — artifact inventory.
> - `print-packet.md`, `print-packet.html`, `print-packet.pdf` — print-friendly shop packet.
> - `site/index.html` — self-contained build-log site, marked private-review until release.
> - `drawings/`, `cad/`, `cnc/` — add operational placeholders and briefs; do not duplicate the existing master equations file.
> - `learn-to-play/` — empty placeholder; downstream `sheet-music` skill will populate once the tuning system is locked.
>
> **Family-variant treatment:**
> All five members (SAM-13-ROOT, SAM-19-MID, SAM-25-CONCERT, SAM-13-AE, SAM-13-MULE) come from one MasterLayout driven by `body_length_mm` and `string_count`. Treat SAM-13-ROOT as the build target; document the others as Pack-and-Go siblings (mirror the fujara → moseno pattern).
>
> **Public release status:**
> Keep this repo **private-review** until:
> - Cultural advisor or musicology review of the provenance language (the Sumerian pattern is public domain, but the "sambuca" name has Hellenistic Greek associations that should be acknowledged).
> - Tension and joint validation on the SAM-13-MULE test build.
> - Brand integration with the Heifer Zephyr wordmark + bison mark, per the memory.
>
> **Things I have already decided — don't re-litigate:**
> - The instrument is a boat-shaped arched harp ("sambuca"), not a lyre. BM curator agrees.
> - Soundhole is at the **keel** (bottom of the hull), projecting forward/down toward the listener. Single oval 80×50 mm for SAM-13-ROOT, scaled by `scale_factor` for larger family members.
> - Tuners are **geared guitar-style hidden behind gold-tone (PVD brass) bulb caps** that visually echo the original gold tuning pegs.
> - Inlay is **Broinwood-style CNC**, parametrically driven from the master sketches; lapis-lazuli-look composite or dyed-veneer-and-epoxy as material.
> - Strings: fluorocarbon trebles, wound nylon basses (specific schedule still being calibrated).
> - SAM-19 gets a low-back positioning belt; SAM-25 gets a saxophone-style shoulder harness; SAM-13 needs no harness.
> - Stand is a CNC-curve-profiled cradle with Japanese **kanawa-tsugi** or **mitsuke-aritsugi** joinery at straight intersections.
> - Brand: **Heifer Zephyr** wordmark with italic-serif treatment per Tony's brand memory; placement open (soundboard inlay or stand-only — propose both).
>
> **Open questions you should raise with me, not assume:**
> - Performance tuning for SAM-13-ROOT: G-major (G3 to E5) or A-major (A3 to F#5)?
> - Mirror handedness: left- or right-handed default, with the other as a mirror configuration?
> - Bridge position: design for Reading A (tailpiece-stern) or Reading B (bow-side bridge), or build a repositionable test bridge for the SAM-13-MULE?
> - Wood pairing for hull / soundboard / neck: cherry-spruce-maple, walnut-cedar-sapele, or all-walnut? My instinct is the middle option for warmth.
> - Public-release timeline: am I targeting the spring or fall capstone window?
>
> **Output discipline:**
> - Mark every assumption explicitly. Don't invent dimensions; if you need one I haven't specified, ask.
> - Cost estimates are planning-only; flag as such.
> - Keep the cultural-provenance language honest: this is *inspired by* the Sumerian pattern, *not* a reproduction.
> - Use the kora repo as your structural template; the conga and fujara repos have valid but different conventions.
>
> Let's start by you reading the eight files above, then proposing the packet build order and asking me the open questions before generating files. I'd rather you ask twice than generate the wrong slate.

---

## Notes for the next session

When you (Tony) paste this prompt into a fresh Cowork session, the instrument-maker-v4 skill will:

1. Read all the files cited.
2. Ask you the open questions.
3. Propose a packet build order.
4. Generate the files iteratively, marking estimates and assumptions.

If the skill jumps ahead and generates files without asking, push back — the kora packet earned its quality from the same disciplined gate-by-gate flow.

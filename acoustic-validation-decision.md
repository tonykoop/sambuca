# Acoustic Validation Decision

Issue: `tonykoop/sambuca#1`

Status: public high-level tracker is acceptable; detailed acoustic validation stays private-review until release gates close.

## Decision

Keep the public issue limited to the decision and gate posture. Do not file detailed public acoustic-validation work yet.

The repo can publicly say that acoustic validation is required, scoped, and not complete. It should not publish detailed measurement results, sensitive source interpretation, private advisor notes, or build-confidence language until the private-review gates are satisfied.

## Evidence considered

- `family-spec.csv` marks `SAM-13-ROOT` as private review and defines `SAM-13-MULE` as the reduced-tension validation build.
- `validation.csv` already separates acoustic checks from public-release blockers. The acoustic rows include SPL, coupled cavity-plate response, tuning drift, Helmholtz frequency, and string-holder-strip voicing checks, while cultural and structural gates remain explicit.
- `design.md` keeps the acoustic model in the Wolfram notebook and states that the repo remains in private review until cultural review, MULE validation, and brand integration are resolved.

## Public-safe scope

Public tracking may include:

- Whether the acoustic validation plan exists.
- Which public files hold the gate definitions.
- Whether validation is complete, incomplete, blocked, or private-review.
- High-level residual risk such as "SPL, coupled response, and tuning drift are unmeasured."

Public tracking should not include:

- Raw private measurement logs before Tony approves release.
- Advisor identities, private correspondence, or redline detail.
- Cultural-source interpretation beyond the already-reviewed public wording.
- Claims that the Sambuca is measured, acoustically validated, fabrication-ready, or public-release-ready before the gates close.

## Current recommendation

Leave issue #1 open as a decision record unless the manager chooses to close it manually after reviewing this PR. The safest public posture is:

> Acoustic validation is planned and gate-defined, but detailed validation work remains private-review until the MULE build data and public-release gates are approved.

## Follow-up gates

- Record SAM-13-MULE SPL, coupled-response, tuning-drift, Helmholtz, and string-holder-strip voicing results in the private build log first.
- Promote only approved summaries into public docs.
- Keep `README.md`, `site/index.html`, and release-facing packet text in private-review posture until the cultural, structural, and brand gates are closed.

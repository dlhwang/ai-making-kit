# Existing Design Review

Execute when an existing design file, drawing, model, prototype, or fabrication package is available.

## Analyze

- File types and source status
- Units and coordinate conventions
- Main parameters
- Critical dimensions
- Fabrication assumptions
- Preview geometry vs fabrication geometry
- Missing dimensions
- Assembly logic
- Known export/parse/render status
- Usability and buildability risks

## Required Distinctions

Separate:

- Source facts
- Measured facts
- User-provided constraints
- Engineering inference
- Unknowns

## Output

Create `making-docs/inception/current-design/existing-design-review.md`.

Include:

- Current design maturity: concept, prototype-ready, fabrication-ready, or release-ready
- Findings
- Risks
- Missing specs
- Recommended revision direction


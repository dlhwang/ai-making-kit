# Work Requirements

## Purpose

Produce an engineering review and improvement direction for a Xiaomi Watch S4 charging dock made from hardboard paper.

## Scope

In scope:

- Review the existing SCAD design.
- Evaluate feasibility for hardboard paper.
- Identify missing specifications.
- Propose user-friendly structural improvements.
- Define a practical next implementation plan.

Out of scope for this pass:

- Final SCAD rewrite.
- Guaranteed final dimensions without physical measurement.
- Manufacturing-ready DXF/SVG export without confirming cutter and material tolerances.

## Deliverables

- BLC tracking documents.
- Engineering design review.
- Hardboard-focused design improvement plan.
- Quality and validation summary.

## Stakeholders

- User/fabricator.
- Future user of the charging dock.

## Acceptance Criteria

- The review identifies whether the current design is buildable from hardboard paper.
- Missing specifications are visible and actionable.
- Recommendations prioritize stable charging, easy assembly, and practical fabrication.
- The next implementation steps are clear.

## Constraints

- Use confirmed facts from source files and user messages.
- Treat unknown physical measurements as open questions.
- Do not overwrite the original SCAD during review.
- Keep the design manufacturable with simple hardboard-paper techniques.

## Risks

- Hardboard thickness and cutting tolerance may differ from the current `3.0 mm` assumption.
- Current tab system is incomplete.
- Current charger pocket may not retain the charger securely.
- Current watch support may depend too much on charger contact instead of a physical cradle.
- Source file comments/encoding are fragile.

## Open Questions

- What is the actual hardboard thickness?
- Will the user cut by hand, cutter plotter, or laser?
- Is glue acceptable?
- Should the charger be removable?
- Should the dock support screen tapping while the watch is docked?

## Recommended Approval Statement

Approve this requirement set to proceed with a hardboard-specific SCAD cleanup and geometry revision.


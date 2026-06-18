# Quality Gate Review

Purpose: apply explicit making quality gates before moving a project from planning to design, design to fabrication, fabrication to prototype, and prototype to release.

Use this during Review And Validation, release packaging, or whenever a project claims to be prototype-ready, fabrication-ready, or release-ready.

## Gate Status Values

Use one of:

- Pass: criteria are satisfied.
- Pass with issues: criteria are mostly satisfied and remaining issues are documented with a safe next action.
- Blocked: critical information or validation is missing.
- Not applicable: gate does not apply to this project.

## Gate 0: Problem Definition

Pass criteria:

- Purpose is clear.
- Target user/builder is identified.
- Use scenario is described.
- Success criteria are defined.
- Major constraints are listed.

Common blocking issues:

- "Make it nice" without a functional success condition.
- No target user or use environment.
- No definition of acceptable fit/use.

## Gate 1: Material And Fabrication Decision

Pass criteria:

- Material is identified.
- Actual or planned material thickness is recorded.
- Fabrication method is identified.
- Joining/adhesive/fastening method is identified.
- Fit tolerance or clearance assumptions are visible.

Common blocking issues:

- CAD proceeds while material is unknown.
- Material thickness is only a catalog assumption for a final design.

## Gate 2: Measurement Readiness

Pass criteria:

- Critical dimensions are known, measured, user-confirmed, or explicitly parameterized.
- Measured values and assumptions are separated.
- Missing measurements have method and impact recorded.
- Critical fit dimensions have a validation plan.

Common blocking issues:

- Critical fit dimensions are assumed but presented as final.
- Real hardware, cable, insert, or material was not tested before full fabrication.

## Gate 3: Fabrication Structure Review

Pass criteria:

- Parts can be physically made with the selected process.
- Part count and layer/stack count are clear.
- Left/right or front/back orientation is clear.
- Glue/fastener/contact faces are sufficient.
- Assembly alignment strategy exists.
- Beginner error points are reduced when novice building matters.

Common blocking issues:

- Slots exist but no tabs or mating part exists.
- Adhesive is required but contact area/location is unclear.
- Mirrored parts are not distinguished.

## Gate 4: CAD/CAM Export Validation

Pass criteria:

- Source CAD exists.
- 3D assembly/preview is available when useful.
- 2D fabrication layout or print/export geometry is available.
- Fit-check view exists when real objects interface.
- Test coupon view/file exists when fabrication is expected.
- Individual part views or identifiers exist when needed.
- Export commands or validation method are documented.

Common blocking issues:

- Only a visual 3D model exists.
- Fabrication geometry and preview dummy geometry are mixed.
- Output file cannot be opened by the intended tool.

## Gate 5: Test Coupon Pass

Pass criteria:

- Coupon was designed for critical risks.
- Coupon was physically made or intentionally scheduled before full build.
- Results are recorded when available.
- Failed features have parameter changes or workarounds.

Common blocking issues:

- Full build starts before testing known fit risks.
- Coupon failure is not tied to a parameter or design change.

## Gate 6: Prototype Pass

Pass criteria:

- Prototype order is defined.
- Irreversible glue/fastening is delayed until fit checks.
- Real parts are tested in the prototype.
- Fit, stability, usability, cable/motion clearance, and failure points are recorded.
- Revision actions are defined.

Common blocking issues:

- Shape looks correct but use fails.
- Assembly succeeds only with undocumented trimming or force.

## Gate 7: Beginner Buildability Pass

Pass criteria:

- Part IDs are visible.
- Quantities and layer counts are clear.
- Orientation is clear.
- Assembly sequence is clear.
- Adhesive/fastener locations are clear.
- Fit check timing is clear.
- Failure adjustment table exists.
- Test coupon is the first build step when relevant.

Common blocking issues:

- CAD exists but no human build instructions exist.
- Novice builder cannot tell how many copies to cut.

## Gate 8: Release Package Pass

Pass criteria:

- Source CAD is preserved.
- Fabrication exports are present or export instructions are clear.
- Test coupon file and report are present when applicable.
- Assembly guide is present.
- Measured specs are present or open measurements are clearly marked.
- Validation report is present.
- Known risks and limitations are recorded.
- Changelog/version information exists.

Common blocking issues:

- Package omits known limitations.
- Prototype feedback exists but has not been reflected in source or backlog.

## Output

Create `making-docs/execution/review/quality-gate-review.md`.

Include:

- gate table from Gate 0 through Gate 8,
- status for each gate,
- evidence/files used,
- blocking issues,
- required next action,
- readiness conclusion: concept-ready, prototype-ready, fabrication-ready, or release-ready.

## Rule

If a gate is Blocked, do not claim readiness for any downstream state that depends on that gate. Record the blocker in `making-docs/audit.md` and either fix it, create a question file, or move it into a revision backlog with a deliberate scope decision.


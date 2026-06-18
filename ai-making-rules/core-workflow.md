# PRIORITY: AI-MAKING workflow for engineering design and physical making projects

When the user requests work involving CAD, drawings, physical fabrication, maker projects, jigs, fixtures, enclosures, paper/cardboard models, laser cutting, 3D printing, CNC, hand cutting, assembly guides, or prototype validation, follow AI-MAKING first.

AI-MAKING is a practical engineering workflow. Its purpose is to turn an idea, drawing, or CAD file into a buildable, testable, and teachable making package.

## Adaptive Workflow Principle

The workflow adapts to the project, but it must never skip material reality.

Any physical design must account for:

- user and use case,
- material,
- fabrication method,
- measured dimensions,
- fit tolerance,
- assembly sequence,
- validation,
- beginner buildability when relevant.

## Rule Details Loading

When performing any AI-MAKING phase, read the relevant rule detail files. Check these paths in order and use the first one that exists:

- `.ai-making/ai-making-rule-details/`
- `.making-rule-details/`
- `ai-making-rule-details/`

All rule detail references below are relative to the resolved rule details directory.

At workflow start, always load:

- `common/process-overview.md`
- `common/session-continuity.md`
- `common/content-validation.md`
- `common/question-format-guide.md`
- `common/terminology.md`

## Output Directory

Create workflow artifacts under `making-docs/` unless the user asks for another location.

Required tracking files:

- `making-docs/making-state.md`
- `making-docs/audit.md`

## Mandatory Content Validation

Before creating any workflow artifact, validate the content according to `common/content-validation.md`.

Do not present an assumed dimension as a measured value.

## Mandatory Question Format

Do not ask multi-choice workflow questions directly in chat. Put them in a dedicated question file using `common/question-format-guide.md`.

## AI-MAKING Three-Phase Workflow

### INCEPTION PHASE

Purpose: understand what should be made, by whom, from what, and under which constraints.

Always execute:

- Project Context Detection
- Making Requirements Analysis
- Material And Fabrication Analysis
- Measurement Plan
- Making Work Planning

Conditional:

- Existing Design Review
- Measured Specs
- User And Scenario Analysis
- Risk And Safety Review
- Work Units Generation

### EXECUTION PHASE

Purpose: create, revise, test, and document a buildable making package.

Always execute when producing deliverables:

- Design Package Creation
- Test Coupon Design
- Review And Validation

Conditional:

- CAD/CAM Deliverable Design
- Test Coupon Report
- Prototype Plan
- Assembly Guide Creation
- Beginner Buildability Review
- Quality Criteria
- Quality Gate Review

### OPERATIONS PHASE

Purpose: make the result repeatable, handoff-ready, and improvable after real builds.

Conditional:

- Prototype Feedback Capture
- Revision Backlog
- Release Package
- Maintenance And Versioning

## INCEPTION PHASE

### Project Context Detection

1. Log the user's raw request in `making-docs/audit.md`.
2. Load `inception/project-context-detection.md`.
3. Detect whether this is a new project, existing design review, revision, prototype build, or production packaging task.
4. Search for existing CAD, drawings, photos, specs, notes, prior docs, measurements, and fabrication files.
5. Create or update `making-docs/making-state.md`.
6. Proceed to Making Requirements Analysis.

### Existing Design Review

Execute when an existing CAD/drawing/prototype is provided.

1. Load `inception/existing-design-review.md`.
2. Identify current geometry, assumptions, missing dimensions, build risks, and usability risks.
3. Separate source facts, measured facts, assumptions, and engineering inference.
4. Record whether the current design is concept-only, prototype-ready, or fabrication-ready.

### Making Requirements Analysis

1. Load `inception/making-requirements-analysis.md`.
2. Clarify purpose, user, use case, environment, success criteria, constraints, tools, materials, and expected deliverables.
3. Determine depth: minimal, standard, or comprehensive.
4. If clarification is needed, create a question file.
5. Generate `making-docs/inception/requirements/making-requirements.md`.

### Material And Fabrication Analysis

1. Load `inception/material-and-fabrication-analysis.md`.
2. Identify material behavior, fabrication method, tolerances, kerf, layer direction, adhesive/fastener strategy, finishing, and tool limits.
3. Generate `making-docs/inception/materials/material-fabrication-analysis.md`.

### Measurement Plan

1. Load `inception/measurement-plan.md`.
2. Define which dimensions must be measured before final design.
3. Create measurement tables distinguishing known values, assumed values, and missing values.
4. Generate `making-docs/inception/measurements/measurement-plan.md`.

### Measured Specs

Execute when real material, parts, tools, prototypes, or user-provided measurements are available.

1. Load `inception/measured-specs.md`.
2. Record actual measured values separately from assumptions, source/catalog values, and user-confirmed values.
3. Identify parameter/file updates and measurements still blocking fabrication readiness.
4. Generate `making-docs/inception/measurements/measured-specs.md`.

### User And Scenario Analysis

Execute when daily use, ergonomics, beginner assembly, multiple users, safety, or maintainability matters.

1. Load `inception/user-and-scenario-analysis.md`.
2. Identify user skill level, assembly context, use sequence, misuse cases, and acceptance expectations.
3. Generate scenario notes.

### Risk And Safety Review

Execute when tools, heat, electricity, loads, sharp edges, structural support, or wearable/device contact matters.

1. Load `inception/risk-and-safety-review.md`.
2. Identify hazards, likely failure modes, mitigation, and test requirements.

### Making Work Planning

1. Load `inception/making-work-planning.md`.
2. Use approved or current context, requirements, materials, measurement plan, and design review.
3. Create `making-docs/inception/plans/making-execution-plan.md`.
4. Include gates: material measurement, test coupon, prototype validation, and release package.

## EXECUTION PHASE

### CAD/CAM Deliverable Design

1. Load `execution/cad-cam-deliverable-design.md`.
2. Define required files, modes/views, export formats, naming conventions, and validation commands.

### Design Package Creation

1. Load `execution/design-package-creation.md`.
2. Create or revise CAD/drawing/source files.
3. Preserve original files unless the user explicitly asks for replacement.
4. Separate visual preview geometry from fabrication geometry.

### Test Coupon Design

1. Load `execution/test-coupon-design.md`.
2. Create a small test artifact for material fit, kerf, slots, holes, tabs, bends, and critical interfaces.
3. Make test coupon output easy to export.

### Test Coupon Report

Execute after a physical test coupon is cut/printed/machined or when the user reports coupon results.

1. Load `execution/test-coupon-report.md`.
2. Record material, tool settings, feature fit results, failures, and parameter changes.
3. Decide whether the coupon passes, passes with changes, or fails.
4. Generate `making-docs/execution/tests/test-coupon-report.md`.

### Prototype Plan

1. Load `execution/prototype-plan.md`.
2. Define prototype order, what to build first, what to test before glue/fasteners, and what failure data to record.

### Assembly Guide Creation

1. Load `execution/assembly-guide-creation.md`.
2. Create an assembly guide with part IDs, quantities, orientation, stacking/layering, adhesive/fastener locations, wait times, and fit checks.

### Beginner Buildability Review

1. Load `execution/beginner-buildability-review.md`.
2. Evaluate whether a novice can complete the build with the provided files, material, and instructions.
3. Recommend simplifications or beginner-specific layouts.

### Quality Criteria

1. Load `execution/quality-criteria.md`.
2. Define accuracy, fit, buildability, safety, usability, documentation, and export criteria.

### Quality Gate Review

Execute when claiming concept-ready, prototype-ready, fabrication-ready, or release-ready status.

1. Load `execution/quality-gate-review.md`.
2. Apply Gate 0 through Gate 8 as relevant.
3. Record pass, pass with issues, blocked, or not applicable for each gate.
4. Generate `making-docs/execution/review/quality-gate-review.md`.

### Review And Validation

1. Load `execution/review-and-validation.md`.
2. Validate deliverables against requirements, material constraints, export commands, measured specs, test coupon coverage/report, quality gate status, and beginner buildability.
3. Create `making-docs/execution/review/review-summary.md`.

## OPERATIONS PHASE

### Prototype Feedback Capture

1. Load `operations/prototype-feedback-capture.md`.
2. Record measured fit, build failures, usability problems, and parameter changes after physical testing.

### Revision Backlog

1. Load `operations/revision-backlog.md`.
2. Create prioritized fixes and next prototype tasks.

### Release Package

1. Load `operations/release-package.md`.
2. Assemble source files, export files, guides, specs, validation notes, and known limitations.

### Maintenance And Versioning

1. Load `operations/maintenance-and-versioning.md`.
2. Define version names, changelog, compatibility notes, and future measurement updates.

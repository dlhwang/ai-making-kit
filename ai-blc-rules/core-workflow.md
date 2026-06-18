# PRIORITY: This workflow OVERRIDES generic assistant behavior for business work
# When the user requests business, operational, planning, analysis, documentation, or coordination work, follow AI-BLC first.

## Adaptive Workflow Principle

**The workflow adapts to the work, not the other way around.**

AI-BLC is for business and practical work, not only software development. The AI model should assess the user's request, existing materials, stakeholders, complexity, risk, and expected deliverables before deciding which stages are needed.

## Rule Details Loading

When performing any AI-BLC phase, read the relevant rule detail files. Check these paths in order and use the first one that exists:

- `.ai-blc/ai-blc-rule-details/`
- `.blc-rule-details/`
- `ai-blc-rule-details/`

All rule detail references below are relative to the resolved rule details directory.

At workflow start, always load:

- `common/process-overview.md`
- `common/session-continuity.md`
- `common/content-validation.md`
- `common/question-format-guide.md`
- `common/terminology.md`

## Output Directory

Create workflow artifacts under `blc-docs/` unless the user asks for another location.

Required tracking files:

- `blc-docs/blc-state.md`
- `blc-docs/audit.md`

## Mandatory Content Validation

Before creating any workflow artifact, validate the content according to `common/content-validation.md`.

## Mandatory Question Format

Do not ask multi-choice workflow questions directly in chat. Put them in a dedicated question file using `common/question-format-guide.md`.

## AI-BLC Three-Phase Workflow

### INCEPTION PHASE

Purpose: Understand what work should be done and why.

Always execute:

- Work Context Detection
- Work Requirements Analysis
- Work Planning

Conditional:

- Current-State Analysis
- Stakeholder Scenarios
- Work Structure Design
- Work Units Generation

### EXECUTION PHASE

Purpose: Design, create, review, and verify business deliverables.

Conditional:

- Deliverable Design
- Quality Criteria
- Communication and Handoff Design

Always execute when producing deliverables:

- Deliverable Creation
- Review and Validation

### OPERATIONS PHASE

Purpose: Make sure the work is used, tracked, and improved.

Conditional:

- Follow-up Management
- Operating Rhythm
- Metrics Monitoring
- Retrospective and Improvement Backlog

## INCEPTION PHASE

### Work Context Detection

1. Log the user's raw request in `blc-docs/audit.md`.
2. Load `inception/work-context-detection.md`.
3. Detect whether this is a new work item, an existing workstream, or a continuation.
4. Search for existing inputs, notes, reports, plans, policies, meeting records, or prior deliverables.
5. Create or update `blc-docs/blc-state.md`.
6. Proceed to Work Requirements Analysis.

### Current-State Analysis

Execute if the work changes an existing process, report, policy, team practice, customer journey, or operating model.

1. Load `inception/current-state-analysis.md`.
2. Analyze existing materials and constraints.
3. Document current workflow, stakeholders, pain points, risks, and known dependencies.
4. Wait for explicit approval before relying on this analysis for planning.

### Work Requirements Analysis

1. Load `inception/work-requirements-analysis.md`.
2. Clarify purpose, scope, stakeholders, success criteria, constraints, risks, and open questions.
3. Determine depth: minimal, standard, or comprehensive.
4. If clarification is needed, create a question file.
5. Generate `blc-docs/inception/requirements/work-requirements.md`.
6. Wait for explicit approval.

### Stakeholder Scenarios

Execute when the deliverable affects multiple people, teams, approvers, customers, or operators.

1. Load `inception/stakeholder-scenarios.md`.
2. Identify stakeholder types and expected outcomes.
3. Create scenarios, acceptance expectations, and decision points.
4. Wait for explicit approval.

### Work Planning

1. Load `inception/work-planning.md`.
2. Use approved context, requirements, current-state analysis, and stakeholder scenarios.
3. Decide which execution and operations stages are needed.
4. Create `blc-docs/inception/plans/execution-plan.md`.
5. Wait for explicit approval.

### Work Structure Design

Execute when the work requires a new process, policy, governance model, report structure, operating cadence, or multi-team coordination model.

1. Load `inception/work-structure-design.md`.
2. Design the structure of the business artifact or operating model.
3. Wait for explicit approval.

### Work Units Generation

Execute for multi-step or multi-owner work.

1. Load `inception/work-units-generation.md`.
2. Break the work into units with owner, input, output, dependency, review gate, and done criteria.
3. Wait for explicit approval.

## EXECUTION PHASE

### Deliverable Design

1. Load `execution/deliverable-design.md`.
2. Design the contents, format, evidence, decision logic, and review path for each deliverable.
3. Wait for explicit approval when the deliverable is high impact.

### Quality Criteria

1. Load `execution/quality-criteria.md`.
2. Define accuracy, completeness, compliance, confidentiality, usability, timing, and communication standards.
3. Use these criteria during review and validation.

### Communication and Handoff Design

Execute when the work must be shared, approved, adopted, operated, or handed off to another person or team.

1. Load `execution/communication-and-handoff-design.md`.
2. Define audience, message, channel, timing, owner, handoff package, and follow-up expectations.
3. Use this design during deliverable creation and operations planning.

### Deliverable Creation

1. Load `execution/deliverable-creation.md`.
2. Create the approved deliverables.
3. Preserve source references, assumptions, and unresolved issues.

### Review and Validation

1. Load `execution/review-and-validation.md`.
2. Validate deliverables against requirements and quality criteria.
3. Produce a review summary with pass/fail items and recommended fixes.
4. Wait for explicit approval before marking execution complete.

## OPERATIONS PHASE

### Operations

1. Load `operations/operations.md`.
2. Create follow-up actions, owners, metrics, review cadence, and improvement backlog when applicable.
3. Update `blc-docs/blc-state.md`.
4. Mark the workflow complete only when deliverables and follow-up expectations are clear.

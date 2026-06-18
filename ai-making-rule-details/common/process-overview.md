# AI-MAKING Process Overview

AI-MAKING has three phases:

1. Inception: understand what should be made and what physical constraints control it.
2. Execution: create, revise, test, and document the making deliverables.
3. Operations: capture prototype feedback and package the design for reuse.

## Adaptive Stage Selection

Always execute:

- Project Context Detection
- Making Requirements Analysis
- Material And Fabrication Analysis
- Measurement Plan
- Making Work Planning
- Design Package Creation, if a design deliverable is requested
- Test Coupon Design, if physical fabrication is expected
- Review And Validation, if deliverables are created

Execute conditionally:

- Existing Design Review, when CAD/drawings/prototypes exist
- User And Scenario Analysis, when usability or novice building matters
- Risk And Safety Review, when loads, tools, electronics, heat, sharp edges, or user contact matter
- CAD/CAM Deliverable Design, when exportable design files are needed
- Prototype Plan, when a physical prototype will be built
- Assembly Guide Creation, when someone must build from the files
- Beginner Buildability Review, when a novice may build it
- Release Package, when output should be reusable

## Text Workflow

```text
User Request
  -> Project Context Detection
  -> Existing Design Review, if existing materials exist
  -> Making Requirements Analysis
  -> Material And Fabrication Analysis
  -> Measurement Plan
  -> User And Scenario Analysis, if needed
  -> Risk And Safety Review, if needed
  -> Making Work Planning
  -> CAD/CAM Deliverable Design, if needed
  -> Design Package Creation
  -> Test Coupon Design
  -> Prototype Plan, if needed
  -> Assembly Guide Creation, if needed
  -> Beginner Buildability Review, if needed
  -> Quality Criteria
  -> Review And Validation
  -> Prototype Feedback Capture, after build
  -> Revision Backlog
  -> Release Package
```

## Guiding Principle

Physical projects fail at the boundary between file and material. AI-MAKING exists to make that boundary explicit.


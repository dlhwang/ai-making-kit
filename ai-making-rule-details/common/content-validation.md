# Content Validation Rules

Before creating or updating any AI-MAKING artifact, validate the content.

## General

- Use clear headings.
- Keep table columns consistent.
- Separate confirmed values, measured values, assumptions, and engineering inference.
- Do not present an assumed dimension as a measured dimension.
- State source for critical dimensions.
- State unresolved fit risks.

## Physical Design

Check every deliverable for:

- Purpose: the object has a clear use.
- Material: material and thickness are identified or marked as unknown.
- Fabrication: cutting/printing/machining method is identified or marked as unknown.
- Tolerance: fit/clearance assumptions are visible.
- Assembly: parts can be joined in a plausible sequence.
- Testability: a test coupon or prototype plan exists when fabrication is expected.
- Usability: the final user action is considered.
- Safety: hazards and obvious failure modes are not buried.

## Validation Failure

If content cannot be validated, do not mark the stage complete. Record the issue in `making-docs/audit.md` and either fix it or ask for clarification using a question file.

## Readiness Claims

Do not claim prototype-ready, fabrication-ready, or release-ready status unless the relevant quality gates have been reviewed or the missing gates are explicitly marked as accepted scope limitations.

In particular:

- Do not claim fabrication-ready when critical measured specs, material thickness, kerf, or fit validation are missing.
- Do not claim release-ready when the test coupon report, validation report, known risks, or changelog are missing for a reusable package.
- Do not claim beginner-ready when part IDs, quantities, orientation, assembly sequence, and failure adjustment guidance are missing.

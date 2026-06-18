# Content Validation Rules

Before creating or updating any AI-BLC artifact, validate the content.

## Markdown

- Use clear headings.
- Avoid broken tables.
- Keep table columns consistent.
- Put assumptions and open questions in explicit sections.
- Do not present uncertain facts as confirmed.

## Diagrams

Prefer text workflows unless a diagram is truly useful.

If using Mermaid:

- Use simple node IDs.
- Quote labels that contain punctuation.
- Include a text alternative.

## Business Content

Check every deliverable for:

- Purpose: the output matches the stated business purpose.
- Scope: included and excluded items are respected.
- Evidence: claims identify source, assumption, or uncertainty.
- Stakeholders: review and approval expectations are visible.
- Risks: material risks and open questions are not buried.
- Actionability: next actions, owners, and dates are clear when needed.

## Validation Failure

If content cannot be validated, do not mark the stage complete. Record the issue in `blc-docs/audit.md` and either fix it or ask for clarification using a question file.

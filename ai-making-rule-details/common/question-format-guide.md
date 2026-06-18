# Question Format Guide

## Mandatory Rule

Do not ask multi-choice workflow questions directly in chat. Put them in a dedicated question file under `making-docs/`.

## File Naming

Use descriptive names:

- `context-questions.md`
- `requirements-questions.md`
- `material-questions.md`
- `measurement-questions.md`
- `fabrication-questions.md`
- `review-questions.md`

## Question Structure

Every question must include meaningful options and an "Other" option as the last option.

```markdown
## Question 1
What fabrication method should this design target first?

A) Hand cutting

B) Laser cutting

C) 3D printing

D) CNC machining

E) Other (please describe after [Answer]: tag below)

[Answer]:
```

## Rules

- Use meaningful options.
- Make options mutually exclusive when possible.
- Include "Other" as the last option.
- Keep each option separated by a blank line.
- After the user fills in answers, read the file and validate every `[Answer]:` field.


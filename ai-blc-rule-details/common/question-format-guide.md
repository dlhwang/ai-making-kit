# Question Format Guide

## Mandatory Rule

Do not ask multi-choice workflow questions directly in chat. Put them in a dedicated question file under `blc-docs/`.

## File Naming

Use descriptive names:

- `context-questions.md`
- `requirements-questions.md`
- `stakeholder-questions.md`
- `planning-questions.md`
- `review-questions.md`

## Question Structure

Every question must include meaningful options and an "Other" option as the last option.

```markdown
## Question 1
What is the primary purpose of this work?

A) Make a decision

B) Inform stakeholders

C) Create an operating process

D) Prepare for approval

E) Other (please describe after [Answer]: tag below)

[Answer]:
```

## Rules

- Use only meaningful options.
- Make options mutually exclusive when possible.
- Include "Other" as the last option.
- Keep each option separated by a blank line.
- After the user fills in answers, read the file and validate that every `[Answer]:` field is complete.

## User Message After Creating Questions

Use this pattern:

```text
I created blc-docs/[file-name] with [N] questions. Please answer each question after the [Answer]: tag. If none of the choices fit, choose Other and describe your answer. Tell me when you are done.
```

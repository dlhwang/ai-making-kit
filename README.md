# AI-MAKING Kit

AI-MAKING Kit is a practical workflow kit for physical making projects: CAD, cardboard models, laser cutting, 3D printing, jigs, fixtures, enclosures, assembly guides, and prototype validation.

The repository root contains the reusable workflow rules and methodology. Finished example projects live under `samples/`.

## What Is In This Kit

| Path | Purpose |
| --- | --- |
| `ai-making-rules/` | Top-level AI-MAKING workflow entry points. |
| `ai-making-rule-details/` | Detailed phase/stage rules for making projects. |
| `docs/methodology/` | Korean methodology documents, checklists, quality gates, and artifact templates. |
| `AI_MAKING_KIT.md` | Short kit overview. |
| `samples/` | Example projects made with this kit. |

## Sample Project

The Xiaomi watch dock is now organized as a sample project:

[`samples/xiaomi-watch-s4-hardboard-charging-dock/`](samples/xiaomi-watch-s4-hardboard-charging-dock/)

Sample highlights:

- OpenSCAD source files.
- AI-MAKING generated project documents.
- A4 1:1 hand-cut templates.
- Maker-facing HTML build manual.
- Exported preview images and SVGs.

Start here for the sample:

[`samples/xiaomi-watch-s4-hardboard-charging-dock/README.md`](samples/xiaomi-watch-s4-hardboard-charging-dock/README.md)

## AI-MAKING Workflow

The main workflow is:

[`ai-making-rules/core-workflow.md`](ai-making-rules/core-workflow.md)

At workflow start, the kit loads common process, session continuity, validation, question format, and terminology rules from:

[`ai-making-rule-details/common/`](ai-making-rule-details/common/)

Project artifacts created by the workflow normally live inside the project or sample under `making-docs/`.

## Repository Layout

```text
.
|-- ai-making-rules/
|-- ai-making-rule-details/
|-- docs/
|   `-- methodology/
|-- samples/
|   `-- xiaomi-watch-s4-hardboard-charging-dock/
|       |-- README.md
|       |-- *.scad
|       |-- docs/
|       |-- making-docs/
|       |   `-- exports/
|       |       |-- build-manual-ko.html
|       |       |-- a4-templates/
|       |       `-- images/
|       `-- tools/
`-- AI_MAKING_KIT.md
```

## Using The Kit For A New Making Project

1. Read `ai-making-rules/core-workflow.md`.
2. Create project artifacts under the project folder's `making-docs/`.
3. Keep source facts, measured facts, assumptions, and engineering inference separate.
4. Create a test coupon before treating a design as fabrication-ready.
5. Add a sample-style README and maker-facing manual when the result should be buildable by another person.

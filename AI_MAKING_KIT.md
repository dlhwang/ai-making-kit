# AI-MAKING Kit Manifest

## Kit Name

AI-MAKING Rules Kit

## Purpose

Engineering design and physical making workflow kit for CAD, fabrication, prototype, assembly, and release-package work.

## Include These Folders

```text
ai-making-rules/
ai-making-rule-details/
```

## Entry Point

```text
ai-making-rules/core-workflow.md
```

## Output Folder Created By Workflow

```text
making-docs/
```

## Required Runtime Behavior

When a project involves a physical object, fabrication, CAD, drawings, test coupons, assembly guides, or prototype validation, load:

```text
ai-making-rules/core-workflow.md
```

Then follow its rule-detail loading instructions.

## Package Contents

```text
ai-making-rules/
  README.md
  core-workflow.md

ai-making-rule-details/
  README.md
  common/
  inception/
  execution/
  operations/
```

## Samples

Example projects made with this kit live under:

```text
samples/
```

Current sample:

```text
samples/xiaomi-watch-s4-hardboard-charging-dock/
```

## Design Philosophy

The kit treats physical design as a complete making package, not a CAD file alone.

Every mature project should move toward:

- measured specs,
- material/fabrication analysis,
- source CAD,
- exportable fabrication files,
- test coupon,
- prototype validation,
- assembly guide,
- beginner buildability review,
- release package.

## Version

Initial local kit version: `0.1.0`

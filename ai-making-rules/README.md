# AI-MAKING Rules Kit

AI-MAKING is a workflow kit for physical making projects. It is meant for work where a file must become a real object: CAD, sheet-material cutting, cardboard models, laser cutting, 3D printing, jigs, fixtures, docks, holders, enclosures, assembly guides, and prototype validation.

## Folder Structure

```text
ai-making-rules/
  core-workflow.md
  README.md

ai-making-rule-details/
  common/
  inception/
  execution/
  operations/
```

## How To Use

Copy these two folders into a project root:

```text
ai-making-rules/
ai-making-rule-details/
```

Then tell the AI:

```text
Read ai-making-rules/core-workflow.md and proceed with this physical design project.
```

The AI should create workflow artifacts under the project folder:

```text
making-docs/
```

## When To Use

Use this kit for:

- OpenSCAD projects
- CAD review
- laser-cut designs
- 3D printing designs
- cardboard, hardboard, and paper models
- acrylic or plywood sheet projects
- jigs and fixtures
- device stands, docks, holders, and cases
- prototype build planning
- beginner assembly guides

## What The Workflow Forces

A physical project must account for:

- user and use case
- material
- fabrication method
- measured dimensions
- fit tolerance
- assembly sequence
- test coupon or prototype validation
- beginner buildability when relevant

## Core Output Package

A mature project should eventually contain:

```text
source CAD
fabrication exports
test coupon
assembly guide
measured specs
validation report
known risks
changelog
release package index
```


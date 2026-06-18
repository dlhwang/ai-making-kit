# AI-MAKING Rules Kit

AI-MAKING은 설계도, CAD, 하드웨어 제작, 메이킹 프로젝트를 실제 제작 가능한 패키지로 만들기 위한 전용 workflow kit입니다.

기존 `ai-blc-rules`가 일반적인 실무/문서/운영 워크플로우라면, AI-MAKING은 물리 제작에 필요한 다음 항목을 강제합니다.

- 재료
- 공법
- 실측
- tolerance
- test coupon
- prototype validation
- assembly guide
- beginner buildability
- release package

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
ai-making-rules/core-workflow.md를 읽고 이 설계 프로젝트를 진행하시오.
```

The AI should create workflow artifacts under:

```text
making-docs/
```

## When To Use

Use this kit for:

- OpenSCAD projects
- CAD review
- laser-cut designs
- 3D printing designs
- cardboard/hardboard/paper models
- acrylic/plywood sheet projects
- jigs and fixtures
- device stands, docks, holders, cases
- prototype build planning
- beginner assembly guides

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

## Relationship To AI-BLC

AI-MAKING can be used as a DLC-style extension to AI-BLC.

Recommended precedence:

- If the task is business/process/documentation only, use AI-BLC.
- If the task creates or revises a physical object, use AI-MAKING first.
- If a physical project also needs project management, handoff, or stakeholder coordination, use AI-BLC around AI-MAKING outputs.


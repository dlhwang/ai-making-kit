# Making Requirements

## Purpose

Produce a new OpenSCAD source file for a Xiaomi Watch S4 charging dock made from laminated hardboard/cardboard.

## Scope

Included:

- Assembly preview.
- 2D cut layout.
- Individual part views.
- Fit-check view.
- Test coupon.
- Beginner-friendly layout.
- Supporting workflow documentation.

Excluded:

- Final DXF/SVG export files.
- Physical measurement report.
- Real prototype feedback.

## Users/Builders

Assumed builder: hobby maker with OpenSCAD and basic sheet-material cutting tools.

## Required Functions

| Function | Requirement |
| --- | --- |
| Hold charger | Charger opening and rear retainer must be parameterized. |
| Present watch | Angled face should support charging alignment and strap clearance. |
| Manage cable | Rear cable hole/channel must avoid a sharp bend. |
| Fabricate from sheets | All manufacturing geometry must be available as 2D layouts. |
| Validate fit | A test coupon must cover tabs, charger opening, cable channel, and angle gauge. |

## Constraints

- Use millimeters.
- Preserve existing SCAD files.
- Do not treat assumed dimensions as measured.
- Target laminated 1.5 mm hardboard/cardboard unless user changes material.

## Deliverables

| Deliverable | Status |
| --- | --- |
| `xiaomi_watch_s4_cardboard_dock_hardboard_v2.scad` | Created |
| AI-MAKING documentation under `making-docs/` | Created |

## Acceptance Criteria

- The SCAD source has separate preview and fabrication modes.
- Test coupon is available as a selectable mode.
- Critical dimensions are parameterized near the top of the file.
- Review notes identify missing measurements.

## Open Questions

- Which sheet material and cutting method will be used for the real build?
- Are the encoded charger/watch dimensions correct for the user's hardware?


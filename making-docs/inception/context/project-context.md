# Project Context

## Classification

Revision/new variant of an existing making project.

## Initial Purpose

Create a new OpenSCAD hardboard/cardboard charging dock design for Xiaomi Watch S4, similar in scope to `xiaomi_watch_s4_cardboard_dock_hardboard.scad`.

## Existing Source Materials

| Source | Status | Notes |
| --- | --- | --- |
| `xiaomi_watch_s4_cardboard_dock.scad` | Existing source context | Earlier design; comments appear mojibake/encoding-damaged. |
| `xiaomi_watch_s4_cardboard_dock_hardboard.scad` | Existing fabrication-oriented design | Clean baseline with assembly, cut layout, fit check, test coupon, and novice layout modes. |

## Known Users/Builders

Unknown. The new design assumes a hobby maker or beginner builder may fabricate the dock.

## Known Tools and Materials

| Item | Known/Assumed |
| --- | --- |
| CAD tool | OpenSCAD |
| Material | Assumed 1.5 mm hardboard/cardboard sheets |
| Fabrication | Assumed hand cutting or laser cutting |
| Assembly | Assumed adhesive lamination |

## Missing Inputs

- Actual sheet thickness.
- Actual cutting kerf.
- Real charger dimensions.
- Real cable diameter and bend stiffness.
- User preference for compactness versus stability.

## Recommended Next Stage

Use the V2 SCAD file to cut the test coupon first, then revise parameters from measured results.


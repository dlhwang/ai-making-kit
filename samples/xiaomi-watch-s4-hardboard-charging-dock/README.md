# Xiaomi Watch S4 Hardboard Charging Dock

This is a sample project made with the AI-MAKING Kit.

It shows how the kit can turn a physical making request into a buildable package: OpenSCAD source, AI-MAKING project documents, A4 hand-cut templates, exported images, and a maker-facing build manual.

## Start Here

Gunpla-style Korean HTML build manual:

[`making-docs/exports/build-manual-ko.html`](making-docs/exports/build-manual-ko.html)

A4 template index:

[`making-docs/exports/a4-templates/index.html`](making-docs/exports/a4-templates/index.html)

A4 print/cut guide:

[`making-docs/exports/a4-print-guide-ko.md`](making-docs/exports/a4-print-guide-ko.md)

## A4 Print Settings

Print the SVG templates with these settings:

- Paper: A4
- Scale: 100%
- Actual size
- Fit to page / shrink to printable area: off

Each template has a `50mm scale check` line. After printing, measure that line with a ruler. If it is not exactly 50mm, fix the printer scale before cutting.

## A4 Templates

Template folder:

[`making-docs/exports/a4-templates/`](making-docs/exports/a4-templates/)

| Order | File | Purpose |
| --- | --- | --- |
| 1 | `a4_00_cut_list.svg` | Full cut quantity list |
| 2 | `a4_01_test_coupon.svg` | Test coupon to cut first |
| 3 | `a4_02_front_rear.svg` | Front and rear panels |
| 4 | `a4_03_base.svg` | Three base panels |
| 5 | `a4_04_side_panels.svg` | Left and right side panels |
| 6 | `a4_05_small_parts.svg` | All small parts |

`a4_04_side_panels.svg` is landscape A4. The other templates are portrait A4.

## Parts To Cut

Based on 1.5mm hardboard.

| ID | Part | Quantity |
| --- | --- | ---: |
| A | Front panel | 2 |
| B | Rear panel | 2 |
| C-L | Left side panel | 2 |
| C-R | Right side panel | 2 |
| D | Base panel | 3 |
| E | Front lip | 2 |
| F | Charger spacer ring | 4 |
| G | Watch saddle | 2 |
| H | Rear retainer | 2 |
| I | Lower brace | 2 |
| J | Angle gauge | Optional 1 |
| K | Glue spreader | Optional 1 |

## Recommended Build Order

1. Print and cut `a4_01_test_coupon.svg`.
2. Check the charger, cable, and tab-slot fit.
3. Print the remaining A4 templates only after the coupon passes.
4. Tape each printout to the hardboard and trace the outline.
5. Cut internal holes first, then outer outlines.
6. Laminate identical layers first.
7. Dry-fit the charger and cable before final glue-up.

## Source Files

Main OpenSCAD source:

[`xiaomi_watch_s4_cardboard_dock_hardboard_v2.scad`](xiaomi_watch_s4_cardboard_dock_hardboard_v2.scad)

Earlier source/context files:

- [`xiaomi_watch_s4_cardboard_dock.scad`](xiaomi_watch_s4_cardboard_dock.scad)
- [`xiaomi_watch_s4_cardboard_dock_hardboard.scad`](xiaomi_watch_s4_cardboard_dock_hardboard.scad)

## Exported References

Image index:

[`making-docs/exports/image-index.md`](making-docs/exports/image-index.md)

Image/SVG folder:

[`making-docs/exports/images/`](making-docs/exports/images/)

## AI-MAKING Artifacts

Workflow state and audit:

- [`making-docs/making-state.md`](making-docs/making-state.md)
- [`making-docs/audit.md`](making-docs/audit.md)

Requirements, material analysis, measurement plan, execution plan, test coupon plan, assembly guide, and review documents are under:

[`making-docs/`](making-docs/)


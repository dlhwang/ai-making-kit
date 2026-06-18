# Xiaomi Watch S4 Cardboard Dock - Fabrication Notes

## Intended Fabrication Style

This design appears intended for cardboard or foamboard construction using flat panel cuts.

The relevant pieces are:

- Front slanted panel.
- Back slanted cable panel.
- Left side support.
- Right side support.
- Base panel.
- Front lip.
- Charger pocket box walls.

## Cutting Layout Intent

The `cut_layout()` module places the major 2D profiles on one plane with a `gap = 18`.

Approximate layout groups:

- Front panel at origin.
- Back panel to the right of the front panel.
- Two side panels below.
- Base panel to the far right.
- Front lip below the base panel.

The layout is extruded by `0.6`, likely as a preview thickness rather than real material thickness.

## Critical Dimensions To Check Physically

Before cutting final material:

- Actual cardboard thickness. The design assumes exactly `3.0 mm`.
- Charger diameter/shape. The charger is modeled as a square `39.5 x 39.5`, but real chargers often have rounded corners or cable strain relief.
- Cable bend radius behind the charger.
- Watch strap clearance through the `28 x 9` slot.
- Watch face and sensor protrusion fit against the charger.
- Whether the front lip height `18 mm` interferes with the strap or watch body.

## Recommended Test Cut

Do not cut the whole dock first. A practical first test is:

1. Cut only the front panel charger opening and strap slot.
2. Check charger fit in the `40.4 x 40.4` pocket opening.
3. Check whether the watch can seat on the charger without the strap binding.
4. Cut one side panel and verify the intended lean angle.
5. Only then cut the full panel set.

## Assembly Concerns

The current source has slot cutouts but not matching protruding tabs. Expect to use one of these until tabs are modeled:

- Glue.
- Paper tape.
- Hot glue.
- Manually added tabs/flaps.
- Separate internal braces.

## Export Notes

For cardboard fabrication, STL is not the ideal final format. Better targets are usually:

- DXF for laser cutting.
- SVG/PDF for printed templates.
- PNG only for visual preview.

OpenSCAD can export 2D formats when the top-level result is 2D. The current `cut_layout()` uses `linear_extrude(height=0.6)`, so it produces a thin 3D object rather than pure 2D geometry. If DXF export is desired, `cut_layout()` should be changed or duplicated into a pure 2D layout module.


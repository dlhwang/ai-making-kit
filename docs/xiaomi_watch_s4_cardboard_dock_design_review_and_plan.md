# Xiaomi Watch S4 Cardboard Dock - Design Review And Plan

## Review Goal

This document evaluates whether `xiaomi_watch_s4_cardboard_dock.scad` contains enough information to become a reliable fabrication design.

Current answer: not yet. The concept is clear, but several required physical dimensions and fabrication decisions are missing. The model should be treated as a first layout/prototype until those values are measured and encoded.

## Current Design Maturity

Status: early parametric prototype.

What is already defined:

- Overall dock envelope.
- Cardboard thickness assumption.
- Watch body diameter and thickness.
- Charger rectangular envelope.
- Charger pocket clearance.
- Main front/back/side/base/lip panel shapes.
- Cable hole and cable channel.
- Strap pass-through slot.
- Visual charger/watch dummy placement.

What is not yet defined well enough:

- Actual interlocking tab system.
- Real watch cradle or retention geometry.
- Pure 2D cutting export.
- Kerf compensation.
- Fold/glue strategy.
- Cable strain-relief geometry.
- Stability validation.
- Manufacturing tolerance per process.

## Missing Or Weak Specifications

### 1. Source Device Measurements

The file assumes the Xiaomi Watch S4 body is circular with:

```text
diameter = 47.3
body thickness = 12.0
sensor thickness = 14.13
```

Missing measurements:

- Back sensor bump diameter.
- Sensor bump height relative to rear surface.
- Charger contact face diameter or shape.
- Actual charger corner radius.
- Charger cable exit position.
- Cable diameter.
- Cable bend radius needed behind dock.
- Strap width near watch body.
- Strap thickness.
- Strap stiffness or minimum bend radius.
- Watch center-of-mass estimate when docked.

Why this matters:

- The current dummy confirms rough location only.
- It cannot guarantee that the charger contacts the sensor correctly.
- It cannot guarantee strap clearance or cable clearance.

### 2. Material And Fabrication Specs

The design assumes:

```text
board_t = 3.0
```

Missing fabrication specs:

- Actual measured cardboard thickness.
- Thickness variation across the sheet.
- Whether material is corrugated cardboard, chipboard, foamboard, acrylic, plywood, or paperboard.
- Cutting method: knife, laser, CNC drag knife, printed template, or hand cut.
- Kerf width.
- Minimum reliable slot width.
- Minimum radius that can be cut cleanly.
- Grain/flute direction, if corrugated cardboard is used.
- Whether folds are allowed or every piece is separate.

Why this matters:

- Tab clearances depend heavily on actual material and cutter.
- `tab_clearance = 0.35` may be loose for laser-cut acrylic but tight or weak for hand-cut corrugated board.

### 3. Docking And Retention Behavior

The current physical supports are:

- Charger pocket.
- Slanted front panel.
- Strap slot.
- Front lip.

Missing behavioral decisions:

- Should the charger be removable or permanently glued?
- Should the watch snap in, rest by gravity, or be retained by a ring/lip?
- Should the watch face be exposed enough to operate while docked?
- Should the strap hang freely behind/through the dock?
- Should the dock work with both closed and open strap positions?
- Should the charger face sit flush with the front panel or protrude slightly?

Why this matters:

- Without these decisions, the charger pocket and watch cradle cannot be finalized.
- A flush charger may fail contact if cardboard thickness or charger depth is off.
- A protruding charger may improve contact but reduce mechanical retention.

### 4. Joint And Tab System

Current state:

- Front/back/side panels include rectangular tab holes.
- No matching protruding tabs are modeled on base, side, front, or back pieces.

Missing joint specs:

- Which part owns each tab.
- Tab length.
- Tab shoulder width.
- Slot orientation.
- Slot offset from edges.
- Whether tabs are friction-fit, glued, folded, or taped.
- Whether tabs need dogbone relief or rounded slot ends.
- Whether the front/back panels slot into the side panels or only into the base.

Why this matters:

- The existing cut layout is not yet a complete self-assembling template.
- Assembly cannot be reliably reproduced from the current geometry alone.

### 5. Front Panel Geometry

Known values:

- Panel outer size: `70 x 105`.
- Charger opening: `40.4 x 40.4`.
- Charger center height: `68`.
- Strap slot: `28 x 9` centered at height `42`.

Potential issues:

- The charger opening is square, but the actual charger may have rounded corners.
- The strap slot may be too narrow or too low depending on strap routing.
- The lower tab cutout positions may be affected by comment/line formatting issues in the source.
- There is no chamfer/lead-in for inserting the charger.

Missing specs:

- Charger opening corner radius.
- Charger front protrusion target.
- Strap slot corner radius based on cut process.
- Minimum material bridge between charger opening and strap slot.
- Minimum material bridge between cutouts and side edges.

### 6. Back Panel Cable Routing

Known values:

- Cable hole diameter: `12`.
- Cable channel width: `7`.
- Channel bottom gap: `5`.

Missing specs:

- Cable diameter.
- Connector/head dimensions, if cable must pass through after assembly.
- Desired cable exit direction.
- Strain relief method.
- Whether cable should be removable.
- Whether the cable channel should be open to the panel edge or hidden behind the dock.

Potential issue:

- A `7 mm` channel may be enough for the cable but not enough for connector routing.

### 7. Side Panel Stability

Known side polygon:

```text
[0,0] -> [86,0] -> [86,105] -> [68,105] -> [16,18] -> [0,18]
```

Missing stability specs:

- Target viewing angle from table.
- Desired center of gravity margin.
- Backward tipping margin.
- Front sliding resistance.
- Base friction assumptions.
- Whether the dock must support screen taps.

Potential issue:

- The side panels are geometric supports, but the design has not been checked against tipping or touch force.

### 8. Export And Manufacturing Output

Current modes include `cut_layout`, but it extrudes the 2D shapes by `0.6`.

Missing output specs:

- Final target output format: DXF, SVG, PDF, STL, or PNG.
- Whether cut lines and score/fold lines need separate layers/colors.
- Whether labels, alignment marks, and scale check markers should be included.
- Sheet size constraints.

Why this matters:

- Cardboard fabrication usually needs 2D curves, not a thin 3D STL.
- The current layout is useful visually, but not yet ideal for a cutter.

## Priority Decisions Needed

These decisions should be made before changing geometry:

1. Fabrication method: hand-cut template, laser/DXF, or 3D-print-style STL.
2. Material: actual cardboard/board type and measured thickness.
3. Charger mounting: removable friction pocket or glued pocket.
4. Watch support: charger-only support, cradle ring, lower lip, or side retainers.
5. Assembly style: glue/tape assembly or interlocking tabs.
6. Output target: preview only, printable template, or production cut file.

## Recommended Work Plan

### Phase 1 - Measurement Baseline

Collect and write down:

- Board thickness at 3-5 points.
- Charger width, depth, thickness, and corner radius.
- Cable diameter and cable exit geometry.
- Watch body diameter, body thickness, sensor bump diameter, sensor bump protrusion.
- Strap width and thickness.

Output:

- Add a `measured_specs.md` document.
- Update SCAD parameter names to separate manufacturer specs from measured clearances.

### Phase 2 - Source Cleanup Without Geometry Changes

Tasks:

- Preserve the original file.
- Create a cleaned UTF-8 working copy.
- Fix comments that appear to swallow intended code.
- Make `mode` override-friendly.
- Remove or mark unused parameters.
- Add a `validate` note with known CLI commands.

Output:

- `xiaomi_watch_s4_cardboard_dock.cleaned.scad` or a direct cleaned replacement after backup.
- Confirm `assembly` renders.
- Confirm each panel mode renders.

### Phase 3 - Fabrication Geometry Completion

Tasks:

- Add matching tabs for all existing tab holes or remove tab holes if glue-only assembly is chosen.
- Define real side-panel-to-base and panel-to-side joints.
- Convert `cut_layout` into true 2D geometry for DXF/SVG export.
- Add labels or optional reference marks only if the target cutter/template benefits from them.

Output:

- Complete cut layout.
- Exportable 2D file path and command.

### Phase 4 - Functional Dock Improvements

Tasks:

- Add a real charger retention strategy.
- Add a real watch cradle or contact ring if needed.
- Verify strap clearance.
- Verify cable route.
- Check front lip interference.

Output:

- Revised assembly preview.
- Fit-check notes.

### Phase 5 - Prototype And Feedback

Tasks:

- Cut a small test coupon for slots/tabs.
- Cut the front panel only and test charger/watch fit.
- Cut one side panel and check angle.
- Assemble a full rough prototype.
- Record what is loose, tight, unstable, or blocked.

Output:

- `prototype_notes.md`.
- Updated clearances and geometry.

## Immediate Next Engineering Tasks

Best next tasks, in order:

1. Create `measured_specs.md` with a checklist and blank values.
2. Create a cleaned SCAD copy that preserves geometry but fixes encoding/comment hazards.
3. Make all modes reliably exportable from CLI.
4. Decide whether the first usable target is a hand-cut PDF/SVG template or a DXF cut file.
5. Implement missing tabs or explicitly switch to glue-only assembly.

## Current Risk Rating

| Area | Risk | Reason |
| --- | --- | --- |
| Fit to charger | Medium | Charger envelope is known, but shape/cable/retention details are missing. |
| Fit to watch | Medium-High | Watch body is approximated, but sensor bump and strap behavior are not fully modeled. |
| Assembly repeatability | High | Slots exist without matching modeled tabs. |
| Fabrication output | High | `cut_layout` is a thin 3D preview, not a pure 2D cut file. |
| Source maintainability | Medium-High | Encoding/comment issues can break parsing when rewritten. |
| Stability | Medium | Overall support exists, but tipping and touch force are not checked. |

## Working Conclusion

The current design is a useful first CAD sketch, not a finished fabrication drawing.

The most important missing information is not another cosmetic dimension; it is the physical fabrication contract: material, cutter, kerf, tab strategy, charger retention, and watch support behavior. Once those are fixed, the SCAD can be cleaned and converted into a reliable cutting template.


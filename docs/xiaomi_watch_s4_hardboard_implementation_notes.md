# Xiaomi Watch S4 Hardboard Dock - Implementation Notes

## Implemented File

Created:

```text
xiaomi_watch_s4_cardboard_dock_hardboard.scad
```

The original source file was preserved:

```text
xiaomi_watch_s4_cardboard_dock.scad
```

## Design Direction Implemented

This revision changes the dock from a concept preview into a hardboard-paper fabrication model.

Implemented decisions:

- Hardboard thickness is produced by stacking sheets.
- Default sheet thickness is `1.5 mm`.
- Main wall panels use `2` layers, giving `3.0 mm`.
- Base uses `3` layers, giving `4.5 mm` for extra weight and stiffness.
- The dock is slightly widened and deepened for better margins.
- Mode selection uses numeric `view_mode` to avoid Windows PowerShell string quoting problems.
- 2D cut layout is separated from 3D preview.

## View Modes

```text
0 assembly
1 cut_layout_2d
2 cut_layout_preview
3 front_panel
4 back_panel
5 side_panel
6 base_panel
7 fit_check
8 test_coupon_2d
9 novice_cut_layout_2d
```

Examples:

```powershell
& 'C:\Program Files\OpenSCAD\openscad.com' -D 'view_mode=1' -o cut_layout.dxf xiaomi_watch_s4_cardboard_dock_hardboard.scad
```

```powershell
& 'C:\Program Files\OpenSCAD\openscad.com' -D 'view_mode=7' -o fit_check.stl xiaomi_watch_s4_cardboard_dock_hardboard.scad
```

## Geometry Improvements

### Hardboard Layering

The new file uses:

```scad
sheet_t = 1.5;
wall_layers = 2;
base_layers = 3;
wall_t = sheet_t * wall_layers;
base_t = sheet_t * base_layers;
```

This matches the agreed direction: build thickness by stacking hardboard sheets.

### Charger Fit

Implemented:

- Rounded charger opening.
- Adjustable charger clearance.
- Adjustable charger face offset.
- Rear retainer part.
- Spacer ring around the charger opening.

Purpose:

- Make charger seating more repeatable.
- Let the charger face sit slightly proud for better charging contact.
- Avoid relying only on pocket friction.

### Watch Support

Implemented:

- Lower horseshoe-style watch saddle.
- Separate `fit_check` view with charger/watch dummy.

Purpose:

- Guide the watch into position.
- Support the watch body instead of relying only on the magnetic charger.
- Keep the upper area open for easy removal.

### Cable Routing

Implemented:

- Wider cable channel.
- Rear cable hole.
- Bend relief around charger height.

Purpose:

- Reduce cable kinking.
- Make assembly less frustrating.

### Assembly Structure

Implemented:

- Base slots for side-frame registration.
- Side-panel tabs.
- Glue-assisted construction assumption.
- Front lip as a simple glued part.

Purpose:

- Tabs locate parts.
- Glue provides strength.
- This is more realistic for hardboard paper than a pure press-fit design.

## Validation Performed

OpenSCAD CLI version:

```text
OpenSCAD 2021.01
```

Validated:

- `view_mode=0` assembly STL export: parses and exports, but reports non-manifold warning because it is a multi-part overlapping preview.
- `view_mode=1` DXF export: top-level object is 2D, export succeeds.
- `view_mode=2` cut preview STL export: succeeds.
- `view_mode=3` front panel STL export: succeeds.
- `view_mode=4` back panel STL export: succeeds.
- `view_mode=5` side panel STL export: succeeds on retry.
- `view_mode=6` base panel STL export: succeeds.
- `view_mode=7` fit check STL export: succeeds and reports a simple 3D object.
- `view_mode=8` test coupon DXF export: top-level object is 2D, export succeeds.
- `view_mode=9` novice layout DXF export: top-level object is 2D, export succeeds.

## Beginner Improvements

Added:

- `test_coupon_2d`: small first-cut pattern for slot/tab, charger opening, strap slot, cable channel, and angle gauge checks.
- `novice_cut_layout_2d`: beginner layout that removes side-panel lightening cutouts and adds helper pieces.
- `angle_gauge_2d`: simple gauge for checking panel lean during glue-up.
- `glue_spreader_2d`: scrap helper for spreading glue thinly.
- Korean assembly guide: `docs/xiaomi_watch_s4_hardboard_assembly_guide_ko.md`.

## Current Limitations

- Actual hardboard sheet thickness still needs measurement.
- Actual charger corner radius and cable geometry still need measurement.
- Strap width/thickness still need measurement.
- Cut layout has no labels yet; OpenSCAD text is intentionally avoided for cutter compatibility.
- The assembly preview is not intended as a single printable manifold STL.

## Recommended Next Step

Generate `cut_layout.dxf` from `view_mode=1`, then test cut a small coupon:

- one base slot,
- one side tab,
- one charger opening corner,
- one strap slot sample.

After the coupon test, tune:

- `sheet_t`,
- `slot_fit`,
- `charger_clearance`,
- `charger_corner_r`,
- `strap_slot_w`,
- `strap_slot_h`.

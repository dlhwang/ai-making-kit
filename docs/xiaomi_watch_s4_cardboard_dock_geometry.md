# Xiaomi Watch S4 Cardboard Dock - Geometry Map

## Parameter Groups

### Device Dimensions

```scad
watch_diameter = 47.3;
watch_body_thickness = 12.0;
watch_sensor_thickness = 14.13;

charger_w = 39.5;
charger_d = 39.5;
charger_t = 9.8;
```

These define the physical watch and charger assumptions. The charger is modeled as a centered cube with dimensions `[charger_w, charger_t, charger_d]`.

### Fabrication Clearance

```scad
clearance = 0.45;
slot_clearance = 0.7;
tab_clearance = 0.35;
```

`clearance` is used for the charger pocket. `tab_clearance` is used for rectangular tab holes. `slot_clearance` is defined but not currently used.

### Dock Envelope

```scad
dock_w = 70;
dock_depth = 86;
dock_h = 105;
back_angle = 62;
front_lip_h = 18;
```

The slanted panels are positioned in `assembly()` with:

```scad
rotate([back_angle - 90, 0, 0])
```

With `back_angle = 62`, this becomes `rotate([-28, 0, 0])`.

## Front Panel

Module:

```scad
front_panel_shape_2d()
front_panel_3d()
```

Nominal outer profile:

- Rectangle: `70 x 105`.
- Extruded by `board_t = 3`.

Cutouts:

- Charger square opening:
  - Width: `charger_pocket_w = 40.4`.
  - Height: `charger_pocket_h = 40.4`.
  - Center height: `charger_center_z = 68`.
- Strap pass-through:
  - Width: `28`.
  - Height: `9`.
  - Center height: `42`.
  - Rounded rectangle radius: `2`.
- Bottom tab holes:
  - Two holes.
  - Each nominally `16.35 x 8.35`, because tab size is `16 x 8` plus `0.35` clearance.

## Charger Pocket Box

Module:

```scad
charger_pocket_box()
```

Outer size:

- Width: `charger_pocket_w + board_t * 2 = 46.4`.
- Height: `charger_pocket_h + board_t * 2 = 46.4`.
- Depth: `charger_pocket_depth + board_t = 13.4`.

Inner void:

- Width: `40.4`.
- Height: `40.4`.
- Depth: approximately `10.6` due to the extra `0.2` cutter depth.

This pocket is placed behind the front panel in assembly mode at charger center height.

## Back Panel

Module:

```scad
back_panel_shape_2d()
back_panel_3d()
```

Nominal outer profile:

- Rectangle: `70 x 105`.
- Extruded by `board_t = 3`.

Cutouts:

- Cable hole:
  - Diameter: `12`.
  - Center: `[dock_w / 2, charger_center_z]`, so `[35, 68]`.
- Cable channel:
  - Width: `7`.
  - Starts at `cable_channel_bottom_gap = 5`.
  - Ends below the cable hole.
  - Height formula: `charger_center_z - cable_hole_d/2 - cable_channel_bottom_gap`.
  - Numeric height: `68 - 6 - 5 = 57`.
- Bottom tab holes:
  - Same tab-hole sizing as the front panel.

## Side Panel

Module:

```scad
side_panel_shape_2d()
side_panel_3d()
```

Outer polygon points:

```scad
[
    [0,0],
    [dock_depth,0],
    [dock_depth,dock_h],
    [dock_depth-18,dock_h],
    [16,front_lip_h],
    [0,front_lip_h]
]
```

Numeric outer polygon:

```text
[0,0] -> [86,0] -> [86,105] -> [68,105] -> [16,18] -> [0,18]
```

Cutouts:

- Internal triangular lightening cutout:

```text
[25,24] -> [58,24] -> [58,72]
```

- Base tab holes:
  - At `x = 28`.
  - At `x = dock_depth - 35`, so `51`.
  - Each `16.35 x 8.35`.

## Base And Lip

Base:

```scad
cube([dock_w, dock_depth, board_t])
```

Numeric size:

```text
70 x 86 x 3
```

Front lip:

```scad
cube([dock_w, board_t, front_lip_h])
```

Numeric size:

```text
70 x 3 x 18
```

## Assembly Placement

The assembly is composed by positioning these parts:

- Base at origin.
- Front lip near the front edge.
- Front panel translated to `[0, dock_depth - 8, board_t]` and rotated by `back_angle - 90`.
- Back panel translated to `[0, dock_depth - 18, board_t]` and rotated by `back_angle - 90`.
- Charger pocket box aligned with the front panel and placed behind its charger opening.
- Side panels at `x = 0` and `x = dock_w`.
- Charger dummy aligned with the charger pocket.
- Watch dummy aligned in front of the charger dummy.


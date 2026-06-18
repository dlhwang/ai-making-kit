# Xiaomi Watch S4 Cardboard Dock - Overview

## Purpose

`xiaomi_watch_s4_cardboard_dock.scad` is an OpenSCAD model for a cardboard docking station for the Xiaomi Watch S4 charger.

The design is parametric and intended for sheet/cardboard fabrication rather than 3D-printing as a single finished object. The default `mode` is `assembly`, which previews how the cut panels, charger pocket, charger dummy, and watch dummy sit together.

## Main Design Assumptions

- Unit: millimeters.
- Material thickness: `board_t = 3.0`.
- Watch body diameter: `47.3`.
- Watch body thickness: `12.0`.
- Watch sensor/bump thickness allowance: `14.13`.
- Charger size: `39.5 x 39.5 x 9.8`.
- Charger pocket inner size: `40.4 x 40.4`.
- Charger pocket depth: `10.4`.
- Overall dock footprint parameters:
  - Width: `dock_w = 70`.
  - Depth: `dock_depth = 86`.
  - Height: `dock_h = 105`.
- Back/front panel lean angle parameter: `back_angle = 62`.

## Supported Modes

The file selects output with the top-level `mode` variable:

- `assembly`: assembled preview.
- `cut_layout`: flattened cutting layout preview.
- `front_panel`: front panel only.
- `back_panel`: back/cable panel only.
- `side_panel`: side support panel only.
- `base_panel`: base panel only.

The default is:

```scad
mode = "assembly";
```

## Physical Parts Represented

- Base panel: rectangular base, `70 x 86 x 3`.
- Front lip: low front retaining wall, `70 x 3 x 18`.
- Slanted front panel: main panel with charger cutout, strap slot, and bottom tab holes.
- Back panel: parallel support/cable guide panel with cable hole and cable channel.
- Two side panels: triangular side supports with weight-reduction cutouts and tab holes.
- Charger pocket box: rear box around the charger opening.
- Charger dummy: black cube used for fit visualization.
- Watch dummy: black cylinder plus strap blocks used for fit visualization.

## Current Validation State

OpenSCAD CLI was installed and the default assembly mode was tested with:

```powershell
& 'C:\Program Files\OpenSCAD\openscad.com' -o _check.stl xiaomi_watch_s4_cardboard_dock.scad
```

Result:

- Parsing completed.
- STL export completed.
- OpenSCAD reported that the mesh is not closed and may not be a valid 2-manifold.

This means the file is usable for preview/analysis, but the default `assembly` output should not be treated as a clean printable mesh without repair. That warning is not surprising because the assembly intentionally overlaps/intersects separate sheet parts and includes visualization dummies.


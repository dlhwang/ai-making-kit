# CAD/CAM Deliverable Design

## Required Files

| File | Purpose |
| --- | --- |
| `xiaomi_watch_s4_cardboard_dock_hardboard_v2.scad` | Parametric OpenSCAD source for V2 dock. |

## Required Modes

| Mode | Name | Purpose |
| --- | --- | --- |
| 0 | assembly | 3D assembled preview. |
| 1 | cut_layout_2d | Fabrication layout. |
| 2 | cut_layout_preview | Layered preview of cut layout. |
| 3 | front_panel | Individual front panel. |
| 4 | rear_panel | Individual rear panel. |
| 5 | side_panel | Individual side panel. |
| 6 | base_panel | Individual base panel. |
| 7 | fit_check | Charger/watch interface check. |
| 8 | test_coupon_2d | Coupon for tuning fit. |
| 9 | beginner_cut_layout_2d | Beginner layout with solid sides and helpers. |
| 10 | exploded_preview | Assembly relationship preview. |

## Export Matrix

| Output | Suggested source mode |
| --- | --- |
| DXF/SVG full cut | `view_mode = 1` or `view_mode = 9` |
| DXF/SVG coupon | `view_mode = 8` |
| STL/preview image | `view_mode = 0` or `view_mode = 10` |

## Validation Matrix

| Validation | Method |
| --- | --- |
| SCAD parse/render | OpenSCAD preview/render. |
| Fabrication layout | Confirm all parts visible in `view_mode = 1` and `9`. |
| Fit coupon | Cut `view_mode = 8` and record results. |


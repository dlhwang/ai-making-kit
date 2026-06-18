# Making Execution Plan

## Recommended Workflow

1. Open `xiaomi_watch_s4_cardboard_dock_hardboard_v2.scad`.
2. Render `view_mode = 8` and export/cut the test coupon.
3. Measure coupon fit and update `sheet_t`, `slot_fit`, `charger_fit`, `cable_channel_w`, and `kerf`.
4. Render `view_mode = 7` for interface fit review.
5. Cut either `view_mode = 1` or `view_mode = 9`.
6. Dry-fit all layers before glue.
7. Glue in stages and test with the real charger/watch.

## Stage Decisions

| Stage | Decision |
| --- | --- |
| Existing design review | Executed |
| Requirements | Executed |
| Material analysis | Executed |
| Measurement plan | Executed |
| CAD/CAM deliverable design | Executed |
| Design package creation | Executed |
| Test coupon design | Executed |
| Prototype plan | Executed |
| Assembly guide | Executed |
| Review and validation | Executed |

## Gate Criteria

| Gate | Pass condition |
| --- | --- |
| Material measurement | Sheet thickness variation recorded. |
| Test coupon | Charger seats without forcing; tabs insert without crushing; cable passes freely. |
| Prototype dry fit | Face panels, side panels, base, cable path, and charger align before glue. |
| Release | Real prototype feedback incorporated. |

## Next Action

Render and cut the V2 test coupon before the full layout.


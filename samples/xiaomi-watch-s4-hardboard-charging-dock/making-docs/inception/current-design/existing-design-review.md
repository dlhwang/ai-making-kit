# Existing Design Review

## Current Design Maturity

`xiaomi_watch_s4_cardboard_dock_hardboard.scad` is prototype-ready, not release-ready, because material thickness, kerf, and real fit data are still unconfirmed.

## Source Facts

| Fact | Source |
| --- | --- |
| Units are millimeters. | Existing SCAD headers. |
| The hardboard version uses view modes for assembly, 2D layouts, parts, fit check, test coupon, and novice layout. | `xiaomi_watch_s4_cardboard_dock_hardboard.scad` |
| The design uses stacked 1.5 mm sheets for walls and base. | `sheet_t`, `wall_layers`, `base_layers` in existing hardboard file. |
| Charger dimensions are encoded as 39.5 x 39.5 x 9.8 mm. | Existing SCAD parameters. |
| Watch diameter is encoded as 47.3 mm. | Existing SCAD parameters. |

## Measured Facts

No new measurements were taken in this session.

## Engineering Inference

- Broad glue faces and laminated layers are appropriate for hardboard/cardboard.
- Test coupons are required because slot fit and charger pocket fit depend on real material and cutting method.
- A beginner layout should reduce fragile cutouts and include helper pieces.

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| Charger opening too tight | Charger cannot seat or is hard to remove | Cut V2 test coupon and tune `charger_fit`. |
| Tabs too loose/tight | Assembly misaligns or needs trimming | Tune `slot_fit` after coupon. |
| Cable bend too sharp | Cable strain or dock not sitting flat | V2 includes larger bend relief and rear channel. |
| Side panels weakened by cutouts | Dock flexes | V2 beginner layout uses solid side panels. |

## Recommended Revision Direction

Create a new V2 file with the same fabrication separation as the hardboard baseline, preserving originals and adding stronger rear cable management, helper pieces, and explicit validation modes.


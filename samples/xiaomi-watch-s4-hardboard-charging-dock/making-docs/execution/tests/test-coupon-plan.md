# Test Coupon Plan

## What to Cut

Use `xiaomi_watch_s4_cardboard_dock_hardboard_v2.scad` with `view_mode = 8`.

The coupon includes:

- Two tab-slot samples.
- One tab sample.
- Charger opening sample.
- Strap slot sample.
- Cable channel sample.
- Angle gauge.
- Lower brace sample.

## What to Measure

| Feature | Pass/fail criteria | Parameter to change if failed |
| --- | --- | --- |
| Tab slot | Tab inserts by hand and does not wobble excessively | `slot_fit`, `kerf`, `sheet_t` |
| Charger opening | Charger seats without forcing and is removable | `charger_fit`, `charger_corner_r` |
| Cable channel | Cable passes freely without crushing | `cable_channel_w`, `cable_d` |
| Strap slot | Strap passes without scraping | `strap_slot_w`, `strap_slot_h` |
| Angle gauge | Supports target face angle during glue-up | `panel_angle` |

## Data to Record

- Actual sheet thickness.
- Cut method.
- Measured kerf estimate.
- Fit result for each feature.
- Any sanding/trimming needed.


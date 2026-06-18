# Assembly Guide

## Tools and Materials

- Printed/exported V2 cut layout.
- Hardboard/cardboard sheets.
- Cutter or laser cutter.
- PVA/wood glue/contact adhesive.
- Caliper or ruler.
- Clamps, tape, or weights.
- Real Xiaomi Watch S4 charger and watch.

## Part Table

| Part | Quantity | Notes |
| --- | --- | --- |
| Front panel | 2 | Stack to make the front face. |
| Rear panel | 2 | Stack to make rear cable face. |
| Side panel | 2 left + 2 right | Use beginner layout for solid sides. |
| Base panel | 3 | Stack for stable base. |
| Front lip | 1 | Prevents sliding. |
| Charger spacer ring | 1 | Glued behind front face. |
| Watch saddle | 1 | Lower support around watch. |
| Rear retainer | 1 | Cable/charger support behind panel. |
| Lower brace | 1 | Rear lower stiffener and cable guide. |
| Angle gauge | 1 optional | Beginner layout helper. |
| Glue spreader | 1 optional | Beginner layout helper. |

## Assembly Sequence

1. Cut `view_mode = 8` test coupon and tune parameters.
2. Cut the selected full layout.
3. Dry-fit side tabs into base slots.
4. Laminate base layers while keeping slots aligned.
5. Laminate front panel layers and rear panel layers.
6. Dry-fit charger through the front panel.
7. Glue charger spacer ring and watch saddle behind the front panel.
8. Glue rear retainer and lower brace behind the rear panel.
9. Use the angle gauge to align front and rear panels on the base.
10. Glue side panels after the face panels are aligned.
11. Add front lip.
12. Test charger, cable, and watch after glue is set.

## Fit Checks

| Check | Action if failed |
| --- | --- |
| Charger too tight | Increase `charger_fit` or sand coupon-confirmed amount. |
| Charger too loose | Reduce `charger_fit` or add a thin paper shim behind retainer. |
| Tabs too tight | Increase `slot_fit`; do not force tabs until they crush. |
| Tabs too loose | Reduce `slot_fit` or use tape while glue cures. |
| Cable binds | Increase `cable_channel_w` or `cable_hole_d`. |

## Warnings

- Do not permanently glue the charger into the dock.
- Do not glue the full assembly before testing the real cable path.
- Keep blade-cut edges clean; fuzzy cardboard edges change fit.


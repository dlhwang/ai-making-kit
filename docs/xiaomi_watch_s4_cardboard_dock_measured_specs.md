# Xiaomi Watch S4 Cardboard Dock - Measured Specs Checklist

## Purpose

Fill this document with real measured values before finalizing the SCAD model. The current model contains useful assumptions, but fabrication-quality geometry needs physical measurements.

Use millimeters.

## Measurement Metadata

| Field | Value |
| --- | --- |
| Measured by |  |
| Date |  |
| Caliper/ruler used |  |
| Material sample |  |
| Cutting method planned |  |

## Board / Material

| Spec | Current SCAD Assumption | Measured Value | Notes |
| --- | ---: | ---: | --- |
| Board thickness | `3.0` |  | Measure at 3-5 locations. |
| Thickness minimum |  |  |  |
| Thickness maximum |  |  |  |
| Kerf width |  |  | Depends on cutter. |
| Slot test tight fit |  |  | Record test coupon result. |
| Slot test loose fit |  |  | Record test coupon result. |
| Grain/flute direction |  |  | Important for corrugated cardboard. |

## Watch

| Spec | Current SCAD Assumption | Measured Value | Notes |
| --- | ---: | ---: | --- |
| Watch body diameter | `47.3` |  |  |
| Watch body thickness | `12.0` |  |  |
| Total rear sensor thickness allowance | `14.13` |  | Confirm meaning. |
| Sensor bump diameter |  |  | Missing from current model. |
| Sensor bump protrusion |  |  | Missing from current model. |
| Strap width near body |  |  | Needed for strap slot. |
| Strap thickness |  |  | Needed for slot height. |
| Strap minimum bend radius |  |  | Estimate by hand if needed. |
| Watch weight |  |  | Needed for stability check. |

## Charger

| Spec | Current SCAD Assumption | Measured Value | Notes |
| --- | ---: | ---: | --- |
| Charger width | `39.5` |  |  |
| Charger depth/height on face | `39.5` |  |  |
| Charger thickness | `9.8` |  |  |
| Charger corner radius |  |  | Current opening is square. |
| Charger face protrusion target |  |  | Flush, recessed, or proud. |
| Cable diameter |  |  | Current channel is `7`. |
| Cable exit position |  |  | Centered or offset. |
| Cable connector max width |  |  | Needed if connector passes through dock. |
| Cable bend radius |  |  | Needed behind pocket. |

## Dock Ergonomics

| Decision | Current Assumption | Final Choice | Notes |
| --- | --- | --- | --- |
| Target viewing angle | `62` degrees from base reference |  | Confirm comfortable angle. |
| Charger mounting | Pocket |  | Removable, friction-fit, or glued. |
| Watch retention | Charger/lip/slot only |  | Add cradle/ring if needed. |
| Strap routing | Through slot |  | Open strap or closed strap. |
| Assembly method | Undefined |  | Glue, tape, tabs, or hybrid. |
| Output format | Undefined |  | DXF, SVG, PDF, STL, PNG. |

## Test Coupon Results

| Test | Value | Result |
| --- | ---: | --- |
| Slot width for `3.0 mm` board |  |  |
| Tab width for friction fit |  |  |
| Minimum clean radius |  |  |
| Cable channel fit |  |  |
| Strap slot fit |  |  |

## Prototype Notes

Record first prototype observations here:

- Charger fit:
- Watch contact:
- Strap interference:
- Cable interference:
- Tipping/stability:
- Parts too tight:
- Parts too loose:
- Geometry changes needed:


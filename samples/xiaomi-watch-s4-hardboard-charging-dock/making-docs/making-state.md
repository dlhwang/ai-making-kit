# Making State

Project: Xiaomi Watch S4 hardboard/cardboard charging dock V2

Current phase: Execution

Current stage: Review and validation

Last completed stage: Design package creation

Next recommended step: Open the V2 SCAD file in OpenSCAD, render `view_mode = 8` test coupon, cut it, and record real fit data before cutting the full layout.

Question file: `making-docs/measurement-questions.md`

Open measurements:

| Item | Status | Why it matters |
| --- | --- | --- |
| Actual sheet thickness | Missing | Controls stacked wall/base thickness and slot fit. |
| Real kerf for selected cutter/blade | Missing | Controls tab/slot looseness and charger opening size. |
| Charger body width/height/thickness | Assumed from prior file | Controls pocket and retainer fit. |
| Cable diameter and bend stiffness | Assumed | Controls cable channel and rear bend relief. |
| Watch strap width/stiffness | Missing | Controls strap slot and saddle comfort. |

Open fabrication decisions:

| Decision | Current assumption |
| --- | --- |
| Material | 1.5 mm hardboard/cardboard, laminated in layers. |
| Cutting method | Hand cutting or laser cutting. |
| Joining | PVA/contact adhesive on broad faces, with tabs for registration. |
| First build | Test coupon before full layout. |

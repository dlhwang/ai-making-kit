# Making Audit

## 2026-06-18

Raw request:

> ai-making-rules/core-workflow.md를 읽고 이 설계 프로젝트를 진행하시오
>
> xiaomi_watch_s4_cardboard_dock_hardboard.scad처럼 새롭게 파일을 만emtldh

Interpretation:

- The user asked to follow the AI-MAKING workflow and create a new file similar to `xiaomi_watch_s4_cardboard_dock_hardboard.scad`.
- The final word appears to be a typo for "만들어" / "make".
- Work is classified as a revision/new variant of an existing OpenSCAD hardboard/cardboard Xiaomi Watch S4 dock design.

Validation notes:

- No new physical measurements were provided in this session.
- Device and charger dimensions are treated as source assumptions inherited from existing files, not measured facts.
- A new source file was added instead of replacing the existing designs.
- OpenSCAD was not available on PATH during validation; render/export validation remains open.
- The workspace folder did not appear to be a Git repository during validation.

## 2026-06-18 Export Update

User requested image exports for maker-facing build reference.

Actions:

- Found OpenSCAD at `C:\Program Files\OpenSCAD\openscad.com`.
- Exported 3D PNG previews for assembly, exploded preview, and fit check.
- Exported 2D PNG previews and SVG drawings for test coupon, standard cut layout, and beginner cut layout.
- Exported individual part reference PNGs for front, rear, side, and base panels.
- Added `making-docs/exports/image-index.md`.

Validation notes:

- OpenSCAD CLI generated the listed files successfully.
- Parallel OpenSCAD export occasionally triggered a Windows `read_symlink` error; sequential reruns succeeded.
- SVG files should be treated as the exact 2D image/export references; PNG files are visual previews.

## 2026-06-18 A4 Hand-Cut Template Update

User clarified the fabrication method: print on A4 paper, place the print on hardboard, trace the outline, and cut by hand.

Actions:

- Added A4 1:1 SVG templates under `making-docs/exports/a4-templates/`.
- Added Korean print/cut guide at `making-docs/exports/a4-print-guide-ko.md`.
- Documented actual hand-cut quantities for 1.5mm hardboard layers.

Important correction:

- For hand cutting from 1.5mm sheet, thick parts must be made by cutting multiple identical layers and gluing them. The practical quantity list is more important than the earlier single large OpenSCAD layout preview.

## 2026-06-18 Illustrated Manual Update

User requested a Gunpla-style illustrated build manual, preferably HTML with images.

Actions:

- Added `making-docs/exports/build-manual-ko.html`.
- The manual includes cover image, parts list, A4 template links, test coupon step, cutting workflow, layer stacking workflow, final assembly steps, and final checklist.
- Existing OpenSCAD-exported PNG/SVG assets are reused as visual references.

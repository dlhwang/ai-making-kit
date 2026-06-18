# Project Context Detection

Purpose: determine what physical making work is being requested and what materials already exist.

## Steps

1. Create `making-docs/` if it does not exist.
2. Create or update `making-docs/audit.md` with the raw user request.
3. Search for existing CAD, drawings, photos, measurements, specs, fabrication files, notes, guides, and prior prototypes.
4. Classify the work:
   - New making project
   - Existing design review
   - Revision of an existing design
   - Prototype test/feedback cycle
   - Release packaging
5. Identify likely fabrication methods.
6. Identify known user, material, tools, constraints, and missing information.
7. Create or update `making-docs/making-state.md`.

## Output

Create `making-docs/inception/context/project-context.md`.

Include:

- Project classification
- Initial purpose
- Existing source materials
- Known users/builders
- Known tools and materials
- Missing inputs
- Recommended next stage


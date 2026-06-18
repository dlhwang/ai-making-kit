# Work Context Detection

Purpose: determine what work is being requested, whether it is new or ongoing, and what context already exists.

## Steps

1. Create `blc-docs/` if it does not exist.
2. Create or update `blc-docs/audit.md` with the raw user request.
3. Look for existing work files: notes, reports, decks, spreadsheets, plans, policies, meeting records, prior decisions, and templates.
4. Classify the work:
   - New work
   - Existing workstream
   - Continuation of a prior AI-BLC workflow
   - Revision of an existing deliverable
5. Identify likely deliverable types.
6. Identify obvious stakeholders, constraints, deadlines, and missing information.
7. Create or update `blc-docs/blc-state.md`.

## Output

Create `blc-docs/inception/context/work-context.md`.

Include:

- Work classification
- Initial purpose
- Known materials
- Known stakeholders
- Known constraints
- Missing information
- Recommended next stage

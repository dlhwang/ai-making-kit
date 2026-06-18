# Measured Specs

Purpose: record dimensions that have actually been measured, separate from assumptions and planned measurements.

Execute when:

- physical parts, materials, tools, or prototypes are available to measure,
- a design is moving from concept/prototype-ready toward fabrication-ready,
- a prior measurement plan has open critical dimensions,
- the user provides measured values.

## Required Distinctions

Separate:

- measured values,
- user-confirmed values,
- source/catalog values,
- assumed values,
- derived engineering values.

Do not copy an assumed or catalog dimension into this artifact as measured.

## Measure As Relevant

- Material thickness at multiple points.
- Thickness variation.
- Kerf or cut width from the intended cutter/tool.
- Critical object outer dimensions.
- Critical object inner/fit dimensions.
- Cable, connector, charger, fastener, or insert dimensions.
- Bend radius, clearance, travel, or moving-part envelope.
- Weight or center of mass when stability matters.
- Ergonomic contact or access dimensions.

## Measurement Table Requirements

For each value, record:

- item,
- measured value,
- unit,
- measurement method,
- tool used,
- sample count or measurement locations,
- date or session,
- confidence,
- impact on design,
- parameter/file to update.

## Output

Create `making-docs/inception/measurements/measured-specs.md`.

Include:

- measured values table,
- user-confirmed values table,
- source/catalog values table,
- assumptions still pending measurement,
- parameter update recommendations,
- dimensions still blocking fabrication readiness.

## Gate Rule

A design may remain concept-ready or prototype-ready with open measurements, but it must not be marked fabrication-ready when critical fit, material thickness, or kerf values remain unmeasured and unvalidated.


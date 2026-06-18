# Test Coupon Report

Purpose: record the physical result of cutting, printing, machining, or assembling a small test coupon before committing to the full build.

Execute when a test coupon has been physically produced or when the user reports coupon results.

## Required Inputs

Use:

- test coupon plan,
- material and fabrication analysis,
- measurement plan or measured specs,
- actual material/tool information from the coupon build.

## Capture

- Coupon file/view used.
- Material used.
- Actual material thickness.
- Tool or machine used.
- Tool settings, if relevant.
- Kerf or effective cut width estimate.
- Features tested.
- Fit results.
- Assembly or adhesive result.
- Failure points.
- Photos or notes, if available.
- Parameters to change.
- Decision: pass, pass with changes, or fail.

## Feature Result Table

For each tested feature, record:

- feature,
- intended dimension or parameter,
- measured result,
- fit result,
- pass/fail,
- required adjustment,
- target file/parameter.

Typical features:

- tab and slot fit,
- material thickness slot,
- critical hole,
- critical corner radius,
- cable/connector pass-through,
- bend relief,
- adhesive sample,
- fastener hole,
- living hinge,
- print tolerance sample,
- angle gauge or alignment sample.

## Output

Create `making-docs/execution/tests/test-coupon-report.md`.

Include:

- coupon summary,
- material/tool details,
- feature result table,
- pass/fail decision,
- required design changes,
- updated parameters,
- next prototype action.

## Gate Rule

Do not proceed to full fabrication when the coupon fails a critical fit or material test unless the failure is documented and a deliberate design change or workaround is recorded.


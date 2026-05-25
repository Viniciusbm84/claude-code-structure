# /test-plan

Generate a test plan from an approved feature spec.

## Usage

```
/test-plan <feature-name>
```

## Instructions

1. Read `specs/features/$ARGUMENTS.md`
2. For each functional requirement, derive:
   - **Happy path** test case
   - **Edge cases** (boundary values, empty input, max limits)
   - **Failure cases** (invalid input, missing deps, network errors)
3. For non-functional requirements, derive:
   - Performance: load test scenario if applicable
   - Security: attack surface checks (auth bypass, injection, etc.)
4. Output the test plan as a markdown checklist grouped by requirement

## Output format

```markdown
## Test Plan: <feature-name>

### REQ-1: <requirement text>
- [ ] Happy path: ...
- [ ] Edge case: ...
- [ ] Failure: ...

### Security
- [ ] ...
```

Save the output to `specs/features/<feature-name>-test-plan.md`.

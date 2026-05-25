# /review

Review the current git diff for correctness, security, and spec compliance.

## Usage

```
/review [--comment]
```

Pass `--comment` to post findings as inline PR comments via `gh`.

## What to check

### Correctness
- Logic errors, off-by-one, wrong conditionals
- Unhandled edge cases that the spec requires
- Missing or broken error paths at system boundaries

### Security
- Unsanitized user input reaching SQL, shell, or eval
- Hardcoded secrets or credentials
- Broken auth checks
- XSS vectors in rendered output

### Spec compliance
- Does the implementation match `specs/features/` requirements?
- Are all done-conditions in the relevant `specs/tasks/` checked off?

### Code quality
- Comments that describe WHAT instead of WHY
- Premature abstractions for requirements not in the spec
- Backwards-compat shims for code that can just be changed

## Output

List findings grouped by severity: CRITICAL → HIGH → MEDIUM → LOW.
Each finding: file:line — description — suggested fix (one line).
End with a verdict: APPROVE / REQUEST CHANGES.

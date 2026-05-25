# /spec-review

Review a feature spec for completeness and quality before implementation begins.

## Usage

```
/spec-review [feature-name]
```

## Checklist applied

For the spec file in `specs/features/$ARGUMENTS.md` (or ask which spec if not provided):

1. **Problem statement** — Is the user problem clearly articulated?
2. **Goal** — Is success measurable or observable?
3. **Functional requirements** — Are all requirements testable? No ambiguity?
4. **Non-functional requirements** — Performance, security, and observability addressed?
5. **Out of scope** — Are exclusions explicit to prevent scope creep?
6. **Open questions** — Are there blockers that must be resolved before coding?
7. **Tasks** — Has `/task-breakdown` been run?
8. **Status** — Is the status set to `approved`?

## Output

Report each checklist item as PASS / WARN / FAIL with a one-line reason.
Summary at the end: READY TO IMPLEMENT or NEEDS WORK (list blockers).

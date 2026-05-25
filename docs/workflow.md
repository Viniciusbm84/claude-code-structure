# Development Workflow

## Spec-Driven Development

Every non-trivial feature follows this pipeline before any code is written.

```
Idea
 │
 ▼
Epic (specs/epics/)
 │  High-level goal, success metrics, timeline
 │
 ▼
Feature Spec (specs/features/)       ← /spec-new <name>
 │  Problem, requirements, out of scope, open questions
 │
 ▼
Spec Review                           ← /spec-review <name>
 │  All requirements testable? Open questions resolved?
 │  Status set to "approved"
 │
 ▼
Task Breakdown (specs/tasks/)         ← /task-breakdown <name>
 │  Atomic tasks, done conditions, file estimates
 │
 ▼
Test Plan (specs/features/*-test-plan.md) ← /test-plan <name>
 │  Happy path, edge cases, failure cases per requirement
 │
 ▼
Implementation
 │  One task at a time, marking done conditions as completed
 │
 ▼
Code Review                           ← /review
 │  Correctness, security, spec compliance
 │
 ▼
Merge
```

## When to skip the pipeline

| Scenario | Skip to |
|---|---|
| Bug fix with clear root cause | Implementation → Review |
| Typo, comment, doc update | Implementation directly |
| Config change, dep bump | Implementation → Review |
| Feature with >1 hour of work | Full pipeline — no shortcuts |

## Agent usage

Spawn agents for focused sub-tasks, not for the whole pipeline:

```
/spec-new my-feature          → runs spec-writer agent
/review                       → runs code-reviewer agent
/test-plan my-feature         → runs test-writer agent
(debugging a failure)         → runs debugger agent
```

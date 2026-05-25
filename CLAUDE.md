# CLAUDE.md

This file configures Claude Code behavior for this project.

## Project Overview

<!-- Describe your project here -->

## Tech Stack

<!-- List your main technologies, frameworks, and tools -->

## Development Workflow

### Spec-Driven Development

All non-trivial features must go through the spec pipeline before implementation:

1. **Epic** → high-level goal in `specs/epics/`
2. **Feature spec** → detailed requirements in `specs/features/`
3. **Task** → atomic implementation units in `specs/tasks/`
4. Run `/spec-new <name>` to scaffold a new spec
5. Run `/spec-review` before merging any feature

### Branch Strategy

- `main` — production-ready
- `feat/<name>` — feature branches (spec required)
- `fix/<name>` — bug fixes
- `chore/<name>` — tooling, deps, config

## Commands (Skills)

Custom slash commands live in `.claude/commands/`. Each `.md` file becomes a `/command`.

| Command | Description |
|---|---|
| `/spec-new` | Scaffold a new feature spec |
| `/spec-review` | Review spec completeness before implementation |
| `/task-breakdown` | Break a spec into atomic tasks |
| `/review` | Code review current diff |
| `/test-plan` | Generate test plan from spec |

## Agents

Agent definitions live in `.claude/agents/`. Each agent has a focused role.

| Agent | Role |
|---|---|
| `spec-writer` | Writes and refines feature specs |
| `code-reviewer` | Reviews code for correctness and security |
| `test-writer` | Generates tests from specs |
| `debugger` | Investigates and diagnoses bugs |

## Hooks

Hooks live in `.claude/hooks/` and run automatically on events.

| Hook | Trigger | Purpose |
|---|---|---|
| `pre-tool-use` | Before any tool runs | Validate dangerous operations |
| `post-tool-use` | After tool runs | Log changes, run linter |
| `pre-commit` | Before git commit | Enforce spec linkage |

## Code Standards

- No comments unless the WHY is non-obvious
- No error handling for impossible cases
- Validate only at system boundaries (user input, external APIs)
- No backward-compatibility shims — change the code directly
- Tests must hit real systems, no mocks for DB/network unless isolated unit test

## Security

- Never commit `.env`, credentials, or secrets
- All user input must be validated at the entry point
- SQL: always use parameterized queries
- No `eval`, no `exec` with unsanitized input

## Memory

Persistent memory lives in `~/.claude/projects/.../memory/`. Claude will update it automatically as the project evolves.

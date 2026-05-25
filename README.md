# Claude Code Structure

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Viniciusbm84/claude-code-structure/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/Viniciusbm84/claude-code-structure?style=flat)](https://github.com/Viniciusbm84/claude-code-structure/stargazers)
[![Forks](https://img.shields.io/github/forks/Viniciusbm84/claude-code-structure?style=flat)](https://github.com/Viniciusbm84/claude-code-structure/forks)

A production-ready project scaffold for [Claude Code](https://claude.ai/code) with custom commands (skills), subagents, hooks, and a spec-driven development workflow.

## What's included

```
├── CLAUDE.md                        # Project configuration for Claude Code
├── .claude/
│   ├── settings.json                # Permissions and hook wiring
│   ├── commands/                    # Custom slash commands
│   │   ├── spec-new.md              # /spec-new <feature>
│   │   ├── spec-review.md           # /spec-review <feature>
│   │   ├── task-breakdown.md        # /task-breakdown <feature>
│   │   ├── test-plan.md             # /test-plan <feature>
│   │   └── review.md                # /review
│   ├── hooks/
│   │   ├── pre-tool-use.sh          # Blocks dangerous shell commands
│   │   ├── post-tool-use.sh         # Runs linter after file edits
│   │   └── on-stop.sh               # Activity log on turn end
│   └── agents/
│       ├── spec-writer.md           # Writes and refines feature specs
│       ├── code-reviewer.md         # Reviews code for bugs and security
│       ├── test-writer.md           # Generates tests from specs
│       └── debugger.md              # Root cause analysis
└── specs/
    ├── epics/TEMPLATE.md            # High-level goal template
    ├── features/TEMPLATE.md         # Feature spec template
    └── tasks/TEMPLATE.md            # Atomic task template
```

## Spec-driven development workflow

Every non-trivial feature follows this pipeline before any code is written:

```
/spec-new <feature>        →  scaffold feature spec
/spec-review <feature>     →  validate completeness
/task-breakdown <feature>  →  break into atomic tasks
/test-plan <feature>       →  generate test cases
(implement)
/review                    →  code review before merge
```

See [`docs/workflow.md`](docs/workflow.md) for the full pipeline.

## Hooks

| Hook | Trigger | What it does |
|---|---|---|
| `pre-tool-use.sh` | Before every Bash call | Blocks destructive patterns (`rm -rf /`, force push to main, `DROP DATABASE`, etc.) |
| `post-tool-use.sh` | After every Edit/Write | Runs the appropriate linter (ruff, eslint, gofmt, shellcheck) |
| `on-stop.sh` | When Claude finishes a turn | Appends a timestamped entry to `.claude/logs/activity.log` |

## Agents

| Agent | Role |
|---|---|
| `spec-writer` | Translates vague requirements into precise, testable specs |
| `code-reviewer` | Finds correctness bugs and security issues — never writes code |
| `test-writer` | Derives tests from specs, not from the implementation |
| `debugger` | Diagnoses root cause before proposing any fix |

## Getting started

1. Clone this repo into your project directory (or use it as a template)
2. Edit `CLAUDE.md` to describe your project, tech stack, and conventions
3. Open the directory with Claude Code — commands, agents, and hooks activate automatically
4. Run `/spec-new <your-first-feature>` to start the workflow

## Requirements

- [Claude Code](https://claude.ai/code) CLI
- `jq` (for hooks) — `apt install jq` / `brew install jq`
- Optional linters: `ruff`, `eslint`, `gofmt`, `shellcheck`

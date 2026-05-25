# /spec-new

Scaffold a new feature spec from scratch.

## Usage

```
/spec-new <feature-name>
```

## What this does

1. Creates `specs/features/<feature-name>.md` from the standard template
2. Links it to an epic in `specs/epics/` (prompts if none exists)
3. Opens the file for editing

## Template applied

```markdown
# Feature: <name>

## Status
draft | review | approved | implemented

## Epic
<!-- Link to parent epic -->

## Problem
<!-- What user problem does this solve? -->

## Goal
<!-- One sentence: what success looks like -->

## Requirements

### Functional
- [ ] ...

### Non-functional
- [ ] Performance: ...
- [ ] Security: ...
- [ ] Observability: ...

## Out of scope
<!-- Explicit exclusions to avoid scope creep -->

## Open questions
<!-- Unresolved decisions that block implementation -->

## Tasks
<!-- Populated by /task-breakdown -->
```

## Instructions

$ARGUMENTS contains the feature name. If empty, ask the user for it.

Create the file at `specs/features/$ARGUMENTS.md` using the template above, replacing `<name>` with the provided feature name and leaving placeholders intact for the user to fill in.

Then report the file path created.

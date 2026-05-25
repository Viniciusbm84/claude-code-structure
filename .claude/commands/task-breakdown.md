# /task-breakdown

Break an approved feature spec into atomic, implementable tasks.

## Usage

```
/task-breakdown <feature-name>
```

## Instructions

1. Read `specs/features/$ARGUMENTS.md`
2. Verify status is `approved` — if not, warn and stop
3. Derive atomic tasks where each task:
   - Can be implemented in one focused coding session
   - Has a clear, verifiable done condition
   - Maps to a single concern (one module, one endpoint, one component)
4. Create task files at `specs/tasks/<feature-name>-<N>.md` for each task
5. Update the `## Tasks` section in the feature spec with links to the created files

## Task file template

```markdown
# Task: <title>

## Parent spec
<!-- Link to feature spec -->

## Description
<!-- What exactly needs to be built -->

## Done when
- [ ] ...

## Files likely touched
- ...

## Dependencies
<!-- Other tasks that must complete first -->
```

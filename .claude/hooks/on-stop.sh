#!/usr/bin/env bash
# On-stop hook — runs when Claude finishes a turn.
# Use for summaries, notifications, or audit logs.

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LOG_FILE=".claude/logs/activity.log"

mkdir -p .claude/logs

echo "[$TIMESTAMP] Claude turn completed" >> "$LOG_FILE"

exit 0

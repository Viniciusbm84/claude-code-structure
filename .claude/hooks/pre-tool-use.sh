#!/usr/bin/env bash
# Pre-tool-use hook — runs before every Bash tool call.
# Receives tool input as JSON on stdin.

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Block dangerous destructive patterns
DANGEROUS_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "dd if="
  "mkfs"
  "> /dev/sd"
  "git push --force origin main"
  "git push --force origin master"
  "DROP TABLE"
  "DROP DATABASE"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qF "$pattern"; then
    echo "BLOCKED: Dangerous command pattern detected: '$pattern'" >&2
    exit 1
  fi
done

exit 0

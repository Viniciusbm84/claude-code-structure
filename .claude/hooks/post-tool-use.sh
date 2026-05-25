#!/usr/bin/env bash
# Post-tool-use hook — runs after Edit/Write tool calls.
# Receives tool result as JSON on stdin.

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Skip if no file path
[ -z "$FILE_PATH" ] && exit 0

# Run linter if file exists and has a known extension
if [ -f "$FILE_PATH" ]; then
  case "$FILE_PATH" in
    *.py)
      command -v ruff &>/dev/null && ruff check --quiet "$FILE_PATH" || true
      ;;
    *.ts|*.tsx|*.js|*.jsx)
      command -v eslint &>/dev/null && eslint --quiet "$FILE_PATH" || true
      ;;
    *.go)
      command -v gofmt &>/dev/null && gofmt -l "$FILE_PATH" || true
      ;;
    *.sh)
      command -v shellcheck &>/dev/null && shellcheck -S warning "$FILE_PATH" || true
      ;;
  esac
fi

exit 0

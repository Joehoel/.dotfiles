---
description: Manage beads (issues) based on conversation context
agent: build
---

Manage beads issues based on the current conversation context.

Available actions:
- Review current issues: `bd list --json`
- Check ready work: `bd ready --json`
- Show issue details: `bd show <id> --json`
- Update status: `bd update <id> --status in_progress --json`
- Close completed: `bd close <id> --reason "..." --json`

If $ARGUMENTS is provided, interpret it as a bd command or action to perform.

Otherwise, analyze the conversation context and:
1. Check `bd ready --json` to see what's unblocked
2. Show current issue status with `bd list --status open --json`
3. Suggest which issues are relevant to the current work
4. Recommend next actions based on the conversation

Always use `--json` flags for bd commands.

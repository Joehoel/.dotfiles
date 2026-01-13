---
description: Create a new bead with provided arguments
agent: build
---

Create a new beads issue.

If $ARGUMENTS is provided, use it as the issue title and any flags.

Examples:
- `/bd-add Fix login validation bug` → creates a task
- `/bd-add Add dark mode -t feature -p 1` → creates a P1 feature
- `/bd-add` (no args) → infer from conversation context

Steps:
1. If arguments provided, create the issue directly:
   `bd create "$ARGUMENTS" --json`

2. If no arguments, analyze the conversation to identify:
   - What task/feature/bug is being discussed
   - Appropriate type (bug, feature, task, chore)
   - Appropriate priority (0-4)
   - Any dependencies on existing issues

3. Create the issue:
   `bd create "Title" -t <type> -p <priority> -d "Description" --json`

4. If this work was discovered while working on another issue, link it:
   `bd dep add <new-id> <parent-id> --type discovered-from`

5. Confirm creation and show the new issue ID.

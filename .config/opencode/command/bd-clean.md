---
description: Review and consolidate beads issues
agent: build
---

Review and clean up beads issues.

Steps:
1. List all open issues:
   `bd list --status open --json`

2. Identify issues that can be cleaned up:
   - Duplicate issues (same or very similar work)
   - Issues that are now obsolete or no longer needed
   - Issues that have been completed but not closed
   - Issues with stale status (in_progress but no recent activity)

3. For duplicates, close the duplicate and reference the primary:
   `bd close <duplicate-id> --reason "Duplicate of <primary-id>" --json`

4. For completed work, close with appropriate reason:
   `bd close <id> --reason "Completed" --json`

5. For obsolete issues:
   `bd close <id> --reason "No longer needed" --json`

6. Review dependency graph for orphaned or circular dependencies:
   `bd dep cycles`

7. Sync changes:
   `bd sync`

8. Report summary of cleanup actions taken.

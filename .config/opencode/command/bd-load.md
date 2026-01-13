---
description: Parse context and create beads from it
agent: build
---

Parse the current conversation or provided context and create beads issues from it.

If $ARGUMENTS is provided, treat it as context to parse (e.g., a list of tasks, requirements, or TODOs).

Steps:
1. Analyze the conversation or provided context for:
   - Action items and tasks
   - Bugs that need fixing
   - Features to implement
   - Technical debt to address
   - TODOs mentioned in discussion

2. For each identified item, determine:
   - Title (clear, concise description)
   - Type (bug, feature, task, chore, epic)
   - Priority (0=critical, 1=high, 2=medium, 3=low, 4=backlog)
   - Dependencies (does this block or depend on other items?)

3. Check existing issues to avoid duplicates:
   `bd list --json`

4. Create issues for new items:
   `bd create "Title" -t <type> -p <priority> -d "Description" --json`

5. Set up dependencies between related issues:
   `bd dep add <child> <parent>`

6. For large features, consider creating an epic with child tasks.

7. Sync changes:
   `bd sync`

8. Report summary of all issues created with their IDs.

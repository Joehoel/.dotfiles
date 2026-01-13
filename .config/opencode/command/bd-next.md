---
description: Find best candidates for next task
agent: build
---

Find the best candidates for the next task to work on.

Steps:
1. Get all ready (unblocked) issues:
   `bd ready --json`

2. Analyze candidates and rank by:
   - Priority (P0 > P1 > P2 > P3 > P4)
   - Dependencies (issues that unblock other work)
   - Context relevance (related to recent conversation/work)
   - Size/complexity (quick wins vs larger efforts)

3. Show top 3-5 candidates with:
   - Issue ID and title
   - Priority and type
   - Why it's a good candidate
   - What it will unblock (if anything)

4. Get details on the top candidate:
   `bd show <id> --json`

5. Recommend which issue to tackle next and why.

6. If user agrees, mark it as in progress:
   `bd update <id> --status in_progress --json`

If $ARGUMENTS contains a preference (e.g., "quick win", "high priority", "frontend"), factor that into the ranking.

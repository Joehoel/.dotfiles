---
description: Analyze changes and commit with a well-crafted message
agent: build
model: anthropic/claude-haiku-4-5-20251001
---

Analyze the current git changes and create a commit.

Steps:
1. Run `git status` to see all changed/untracked files
2. Run `git diff` to see unstaged changes
3. Run `git log --oneline -5` to understand this repo's commit message style
4. Analyze the changes and draft a concise commit message that:
   - Summarizes the nature of the changes (feature, fix, refactor, docs, etc.)
   - Focuses on the "why" rather than the "what"
   - Follows the repository's existing commit style
   - Is 1-2 sentences max
5. Stage all changes with `git add -A`
6. Create the commit with `git commit -m "..."`
7. Show the result with `git status`

If the user provided a hint via $ARGUMENTS, incorporate it into the commit message.

Do NOT:
- Commit files that contain secrets (.env, credentials.json, etc.) - warn the user instead
- Push to remote (only commit locally)
- Use `git commit --amend`

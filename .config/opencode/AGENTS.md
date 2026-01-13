# Global Agent Instructions

## Beads Task Tracking Integration

When starting work in any project, check if Beads is configured:

1. Check if `.beads/` directory exists in the project root
2. Check if `bd` command is available in PATH

### If Beads IS configured (both conditions met):

1. **Load the beads skill** using the skill tool to get full workflow instructions
2. **Check for ready work** with `bd ready --json` before asking "what should I work on?"
3. **Use bd for persistent task tracking** when:
   - Work spans multiple sessions
   - Tasks have dependencies or blockers
   - Context needs to survive conversation compaction
4. **Sync before ending sessions** with `bd sync`

### If Beads is NOT configured:

- Do NOT load the beads skill
- Do NOT attempt to use `bd` commands
- Do NOT reference beads in any way
- Use TodoWrite for task tracking within the session

## Project Initialization

When the `/init` command is run and you are editing or augmenting a project's AGENTS.md file, check if Beads is configured in that project. If `.beads/` directory exists and `bd` is available, include the following section in the project's AGENTS.md:

```markdown
## Task Tracking

This project uses Beads for persistent task tracking. Load the `beads` skill for detailed workflow instructions.

Quick reference:
- `bd ready --json` - Find unblocked work
- `bd show <id> --json` - Get task context
- `bd update <id> --status in_progress --json` - Start work
- `bd close <id> --reason "..." --json` - Complete task
- `bd sync` - Persist to git (run at session end)
```

If Beads is not configured, do not add any beads-related content to the project's AGENTS.md.

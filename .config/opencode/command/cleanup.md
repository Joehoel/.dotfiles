---
description: Mark feature complete, remove unused code, simplify complexity
agent: build
---

The user has confirmed the current functionality is working as expected.

Your task now is to clean up the codebase:

1. **Remove unused code** - Delete any code that was added during development but is no longer used:
   - Unused imports
   - Unused variables and functions
   - Commented-out code blocks
   - Dead code paths
   - Unused dependencies

2. **Simplify overly complex code** - Refactor any code that is more complicated than necessary:
   - Reduce nesting levels where possible
   - Extract complex conditionals into well-named variables or functions
   - Simplify convoluted logic
   - Remove unnecessary abstractions
   - Consolidate duplicated code

3. **Verify nothing breaks** - After cleanup, ensure the functionality still works as expected.

Focus only on the code that was recently added or modified. Do not refactor unrelated parts of the codebase.

# Repository Guidelines

## Project Structure & Module Organization
- Source: `git-town.plugin.zsh` — Zsh plugin providing aliases and safe wrappers for Git Town.
- Docs: `README.md` — installation, alias tables, troubleshooting; update when adding commands.
- License: `LICENSE`. No other build assets or modules.
- Plugin architecture: short `gt*` aliases plus `gtt_*` conflict-free functions; optional live completion.

## Build, Test, and Development Commands
- Develop locally: `source ./git-town.plugin.zsh` then try `gtth`, `gtt_hack`.
- Syntax check: `zsh -n git-town.plugin.zsh` (parses without executing).
- Optional lint: `shellcheck -x git-town.plugin.zsh` (may flag zshisms; use judgment).
- Reload shell: `exec zsh` or `source ~/.zshrc` after changes.
- Completion (optional): `eval "$(git town completion zsh)"` or set `GIT_TOWN_ZSH_LIVE_COMPLETION=1` before loading.

## Coding Style & Naming Conventions
- Indentation: 2 spaces; no tabs. Keep lines simple; prefer one alias/function per line.
- Aliases: short, lowercase, start with `gtt` (e.g., `gtth`, `gttsy`).
- Functions: `gtt_*` snake_case mirroring commands (e.g., `gtt_diff_parent`). Always add a function for each alias.
- Group by feature with comment headers; keep ordering stable and logical.
- Avoid shadowing user aliases; expose both alias and function when adding new commands.

## Testing Guidelines
- Manual check: `git town --version`, then run `gtth`, `gttsh`, and `gtt_hack` counterparts.
- Minimal env: `zsh -f -c 'source ./git-town.plugin.zsh; type gtth gtt_hack'`.
- Verify README tables reflect every new alias/function pair; confirm behavior on macOS/Linux and Oh My Zsh/manual install.

## Commit & Pull Request Guidelines
- Commits: follow Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`). Keep messages imperative and scoped.
- PRs: include a clear description, related issues, command examples (before/after), and test notes (OS, zsh, Git Town versions).
- Required: update `README.md` alias tables and any usage notes impacted by the change.

## Security & Configuration Tips
- Safe guard: plugin returns early if `git` or `git town` is unavailable.
- Prefer documenting `gtt_*` functions where alias collisions are likely.
- Do not add commands that perform network or repository mutations implicitly without explicit user intent.

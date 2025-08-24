# zsh-git-town

A comprehensive Oh My Zsh plugin for [Git Town](https://www.git-town.com/) with convenient aliases and utility functions.

## Features

- **Short aliases** for all Git Town commands
- **Safe wrapper functions** to avoid conflicts with other plugins
- **Optional completion support** (on-demand)
- **Zero configuration** - works out of the box

## Installation

### Oh My Zsh

```sh
git clone https://github.com/mkusaka/zsh-git-town ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-git-town
```

Then add to your `~/.zshrc`:

```zsh
plugins=(... zsh-git-town)
```

### Manual Installation

```sh
git clone https://github.com/mkusaka/zsh-git-town ~/.zsh-git-town
echo "source ~/.zsh-git-town/git-town.plugin.zsh" >> ~/.zshrc
```

## Aliases Reference

### Core Commands

| Alias  | Command             | Description                           |
|--------|---------------------|---------------------------------------|
| `gtt`  | `git town`          | Main Git Town command                |
| `gth`  | `git town hack`     | Create a new feature branch          |
| `gtsy` | `git town sync`     | Sync current branch with remote      |
| `gtsw` | `git town switch`   | Switch branches with dependency check|
| `gtp`  | `git town propose`  | Create a PR/MR                       |
| `gtsh` | `git town ship`     | Ship feature (merge and cleanup)     |

### Error Recovery & Progress Control

| Alias  | Command                   | Description                    |
|--------|---------------------------|--------------------------------|
| `gtc`  | `git town continue`       | Continue after conflict        |
| `gtrl` | `git town runlog`         | Show execution log             |
| `gtsk` | `git town skip`           | Skip current branch in process |
| `gtsu` | `git town status`         | Show current status            |
| `gtss` | `git town status show`    | Show detailed run state        |
| `gtsr` | `git town status reset`   | Reset run state                |
| `gtun` | `git town undo`           | Undo last Git Town operation  |

### Stack Operations

| Alias  | Command                   | Description                      |
|--------|---------------------------|----------------------------------|
| `gtap` | `git town append`         | Add child branch at end          |
| `gtdt` | `git town detach`         | Detach branch from parent        |
| `gtdp` | `git town diff-parent`    | Show diff with parent branch     |
| `gtmg` | `git town merge`          | Merge parent into current        |
| `gtpd` | `git town prepend`        | Insert branch between parent     |
| `gtsp` | `git town set-parent`     | Change parent branch             |
| `gtswp`| `git town swap`           | Swap parent-child relationship   |
| `gtwk` | `git town walk`           | Walk stack and execute commands  |

### Sync Strategies

| Alias  | Command                | Description                        |
|--------|------------------------|------------------------------------|
| `gtct` | `git town contribute`  | Stop partial sync (for teams)     |
| `gtob` | `git town observe`     | Stop syncing your contributions   |
| `gtpk` | `git town park`        | Completely stop syncing            |
| `gtpt` | `git town prototype`   | Local-only mode (no push)         |

### Configuration & Setup

| Alias   | Command                      | Description                  |
|---------|------------------------------|------------------------------|
| `gtcpl` | `git town completion`        | Generate shell completion    |
| `gtcfg` | `git town config`            | Show/update configuration    |
| `gtcfgp`| `git town config get-parent` | Show parent of current branch|
| `gtcfrm`| `git town config remove`     | Remove all Git Town config   |
| `gtcfgs`| `git town config setup`      | Interactive setup            |
| `gtoff` | `git town offline`           | Toggle offline mode          |

### Additional Commands

| Alias   | Command              | Description                        |
|---------|----------------------|------------------------------------|
| `gtb`   | `git town branch`    | Show branch hierarchy/types        |
| `gtcps` | `git town compress`  | Squash commits                     |
| `gtdel` | `git town delete`    | Safely delete feature branch       |
| `gthp`  | `git town help`      | Show help                          |
| `gtrn`  | `git town rename`    | Rename branch (updates relations)  |
| `gtre`  | `git town repo`      | Open repository in browser         |

## Safe Function Alternatives

If aliases conflict with other plugins, you can use the `gtt_*` function versions:

```zsh
gtt_hack        # instead of gth
gtt_sync        # instead of gtsy
gtt_switch      # instead of gtsw
# ... and so on for all commands
```

## Completion Support (Optional)

Git Town provides excellent shell completion. To enable it:

### Option A: Runtime Generation (Recommended for latest features)

Add to your `~/.zshrc` after loading the plugin:

```zsh
eval "$(git town completion zsh)"
```

### Option B: Environment Variable

Set this before loading the plugin to auto-enable completion:

```zsh
export GIT_TOWN_ZSH_LIVE_COMPLETION=1
plugins=(... zsh-git-town)
```

## Requirements

- [Git Town](https://www.git-town.com/) must be installed
- Zsh shell
- Oh My Zsh (optional but recommended)

## Troubleshooting

### Aliases not working

1. Ensure Git Town is installed: `git town --version`
2. Reload your shell: `source ~/.zshrc`
3. Check if the plugin is loaded: `which gth`

### Conflicts with other aliases

Use the safe function versions (`gtt_*`) instead of the short aliases.

## Contributing

Pull requests are welcome! When adding new aliases:

1. Follow the existing naming pattern (`gt*` for aliases, `gtt_*` for functions)
2. Update the README tables
3. Test with both Oh My Zsh and manual installation

## License

MIT - See [LICENSE](LICENSE) file for details

## Links

- [Git Town Documentation](https://www.git-town.com/)
- [Git Town GitHub](https://github.com/git-town/git-town)
- [Oh My Zsh](https://ohmyz.sh/)
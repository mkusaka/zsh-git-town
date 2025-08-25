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
| `gtt`   | `git town`          | Main Git Town command                |
| `gtth`  | `git town hack`     | Create a new feature branch          |
| `gttsy` | `git town sync`     | Sync current branch with remote      |
| `gttsw` | `git town switch`   | Switch branches with dependency check|
| `gttp`  | `git town propose`  | Create a PR/MR                       |
| `gttsh` | `git town ship`     | Ship feature (merge and cleanup)     |

### Error Recovery & Progress Control

| Alias  | Command                   | Description                    |
|--------|---------------------------|--------------------------------|
| `gttc`  | `git town continue`       | Continue after conflict        |
| `gttrl` | `git town runlog`         | Show execution log             |
| `gttsk` | `git town skip`           | Skip current branch in process |
| `gttsu` | `git town status`         | Show current status            |
| `gttss` | `git town status show`    | Show detailed run state        |
| `gttsr` | `git town status reset`   | Reset run state                |
| `gttun` | `git town undo`           | Undo last Git Town operation  |

### Stack Operations

| Alias  | Command                   | Description                      |
|--------|---------------------------|----------------------------------|
| `gttap` | `git town append`         | Add child branch at end          |
| `gttdt` | `git town detach`         | Detach branch from parent        |
| `gttdp` | `git town diff-parent`    | Show diff with parent branch     |
| `gttmg` | `git town merge`          | Merge parent into current        |
| `gttpd` | `git town prepend`        | Insert branch between parent     |
| `gttsp` | `git town set-parent`     | Change parent branch             |
| `gttswp`| `git town swap`           | Swap parent-child relationship   |
| `gttwk` | `git town walk`           | Walk stack and execute commands  |

### Sync Strategies

| Alias  | Command                | Description                        |
|--------|------------------------|------------------------------------|
| `gttct` | `git town contribute`  | Stop partial sync (for teams)     |
| `gttob` | `git town observe`     | Stop syncing your contributions   |
| `gttpk` | `git town park`        | Completely stop syncing            |
| `gttpt` | `git town prototype`   | Local-only mode (no push)         |

### Configuration & Setup

| Alias   | Command                      | Description                  |
|---------|------------------------------|------------------------------|
| `gttcpl` | `git town completion`        | Generate shell completion    |
| `gttcfg` | `git town config`            | Show/update configuration    |
| `gttcfgp`| `git town config get-parent` | Show parent of current branch|
| `gttcfrm`| `git town config remove`     | Remove all Git Town config   |
| `gttcfgs`| `git town config setup`      | Interactive setup            |
| `gttoff` | `git town offline`           | Toggle offline mode          |

### Additional Commands

| Alias   | Command              | Description                        |
|---------|----------------------|------------------------------------|
| `gttb`   | `git town branch`    | Show branch hierarchy/types        |
| `gttcps` | `git town compress`  | Squash commits                     |
| `gttdel` | `git town delete`    | Safely delete feature branch       |
| `gtthp`  | `git town help`      | Show help                          |
| `gttrn`  | `git town rename`    | Rename branch (updates relations)  |
| `gttre`  | `git town repo`      | Open repository in browser         |

## Safe Function Alternatives

If aliases conflict with other plugins, you can use the `gtt_*` function versions:

```zsh
gtt_hack        # instead of gtth
gtt_sync        # instead of gttsy
gtt_switch      # instead of gttsw
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
3. Check if the plugin is loaded: `which gtth`

### Conflicts with other aliases

Use the safe function versions (`gtt_*`) instead of the short aliases.

## Contributing

Pull requests are welcome! When adding new aliases:

1. Follow the existing naming pattern (`gtt*` for aliases, `gtt_*` for functions)
2. Update the README tables
3. Test with both Oh My Zsh and manual installation

## License

MIT - See [LICENSE](LICENSE) file for details

## Links

- [Git Town Documentation](https://www.git-town.com/)
- [Git Town GitHub](https://github.com/git-town/git-town)
- [Oh My Zsh](https://ohmyz.sh/)

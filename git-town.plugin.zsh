#!/usr/bin/env zsh

# Guard: Check if git and git-town are available
if ! command -v git >/dev/null 2>&1 || ! git town --version >/dev/null 2>&1; then
  return
fi

# ============= Aliases =============

# Main command
alias gtt='git town'

# Core commands
# New prefix: gtt*
alias gtth='git town hack'
alias gttsy='git town sync'
alias gttsw='git town switch'
alias gttp='git town propose'
alias gttsh='git town ship'

# Error recovery & progress control
alias gttc='git town continue'
alias gttrl='git town runlog'
alias gttsk='git town skip'
alias gttsu='git town status'
alias gttss='git town status show'
alias gttsr='git town status reset'
alias gttun='git town undo'

# Stack operations
alias gttap='git town append'
alias gttdt='git town detach'
alias gttdp='git town diff-parent'
alias gttmg='git town merge'
alias gttpd='git town prepend'
alias gttsp='git town set-parent'
alias gttswp='git town swap'
alias gttwk='git town walk'

# Sync strategies
alias gttct='git town contribute'
alias gttob='git town observe'
alias gttpk='git town park'
alias gttpt='git town prototype'

# Configuration & setup
alias gttcpl='git town completion'
alias gttcfg='git town config'
alias gttcfgp='git town config get-parent'
alias gttcfrm='git town config remove'
alias gttcfgs='git town config setup'
alias gttoff='git town offline'

# Additional commands
alias gttb='git town branch'
alias gttcps='git town compress'
alias gttdel='git town delete'
alias gtthp='git town help'
alias gttrn='git town rename'
alias gttre='git town repo'

# ============= Safe Functions (conflict-free alternatives) =============

gtt_hack()              { git town hack "$@"; }
gtt_sync()              { git town sync "$@"; }
gtt_switch()            { git town switch "$@"; }
gtt_propose()           { git town propose "$@"; }
gtt_ship()              { git town ship "$@"; }

gtt_continue()          { git town continue "$@"; }
gtt_runlog()            { git town runlog "$@"; }
gtt_skip()              { git town skip "$@"; }
gtt_status()            { git town status "$@"; }
gtt_status_show()       { git town status show "$@"; }
gtt_status_reset()      { git town status reset "$@"; }
gtt_undo()              { git town undo "$@"; }

gtt_append()            { git town append "$@"; }
gtt_detach()            { git town detach "$@"; }
gtt_diff_parent()       { git town diff-parent "$@"; }
gtt_merge()             { git town merge "$@"; }
gtt_prepend()           { git town prepend "$@"; }
gtt_set_parent()        { git town set-parent "$@"; }
gtt_swap()              { git town swap "$@"; }
gtt_walk()              { git town walk "$@"; }

gtt_contribute()        { git town contribute "$@"; }
gtt_observe()           { git town observe "$@"; }
gtt_park()              { git town park "$@"; }
gtt_prototype()         { git town prototype "$@"; }

gtt_completion()        { git town completion "$@"; }
gtt_config()            { git town config "$@"; }
gtt_config_get_parent() { git town config get-parent "$@"; }
gtt_config_remove()     { git town config remove "$@"; }
gtt_config_setup()      { git town config setup "$@"; }
gtt_offline()           { git town offline "$@"; }

gtt_branch()            { git town branch "$@"; }
gtt_compress()          { git town compress "$@"; }
gtt_delete()            { git town delete "$@"; }
gtt_help()              { git town help "$@"; }
gtt_rename()            { git town rename "$@"; }
gtt_repo()              { git town repo "$@"; }

# ============= Completion Support =============

# Descriptions shown during completion for aliases/functions
# NOTE: keep in sync with the README alias tables
typeset -A _gtt_desc
_gtt_desc+=(
  # Core
  gtth      'Create a new feature branch'
  gttsy     'Sync current branch with remote'
  gttsw     'Switch branches with dependency check'
  gttp      'Create a PR/MR'
  gttsh     'Ship feature (merge and cleanup)'

  # Error recovery & progress
  gttc      'Continue after conflict'
  gttrl     'Show execution log'
  gttsk     'Skip current branch in process'
  gttsu     'Show current status'
  gttss     'Show detailed run state'
  gttsr     'Reset run state'
  gttun     'Undo last Git Town operation'

  # Stack ops
  gttap     'Add child branch at end'
  gttdt     'Detach branch from parent'
  gttdp     'Show diff with parent branch'
  gttmg     'Merge parent into current'
  gttpd     'Insert branch between parent'
  gttsp     'Change parent branch'
  gttswp    'Swap parent-child relationship'
  gttwk     'Walk stack and execute commands'

  # Sync strategies
  gttct     'Stop partial sync (for teams)'
  gttob     'Stop syncing your contributions'
  gttpk     'Completely stop syncing'
  gttpt     'Local-only mode (no push)'

  # Config & setup
  gttcpl    'Generate shell completion'
  gttcfg    'Show/update configuration'
  gttcfgp   'Show parent of current branch'
  gttcfrm   'Remove all Git Town config'
  gttcfgs   'Interactive setup'
  gttoff    'Toggle offline mode'

  # Additional
  gttb      'Show branch hierarchy/types'
  gttcps    'Squash commits'
  gttdel    'Safely delete feature branch'
  gtthp     'Show help'
  gttrn     'Rename branch (updates relations)'
  gttre     'Open repository in browser'

  # Main
  gtt       'Main Git Town command'
)

# Mirror descriptions for function variants (gtt_* -> same description)
{
  local __alias __sub __func
  for __alias __sub in ${(kv)_gtt_subcmd}; do
    # Skip main command
    [[ "$__alias" == gtt ]] && continue
    # Build function name from subcommand words (e.g., 'status show' -> gtt_status_show)
    __func=gtt_${${__sub// /_}}
    # If we have a description for the alias, mirror it to the function
    if [[ -n ${_gtt_desc[$__alias]} ]]; then
      _gtt_desc[$__func]="${_gtt_desc[$__alias]}"
    fi
  done
}

# Explicit mapping alias/function -> subcommand words
# Used to delegate to official _git-town completion
typeset -A _gtt_subcmd
_gtt_subcmd+=(
  # Core
  gtth      'hack'
  gttsy     'sync'
  gttsw     'switch'
  gttp      'propose'
  gttsh     'ship'

  # Error recovery & progress
  gttc      'continue'
  gttrl     'runlog'
  gttsk     'skip'
  gttsu     'status'
  gttss     'status show'
  gttsr     'status reset'
  gttun     'undo'

  # Stack ops
  gttap     'append'
  gttdt     'detach'
  gttdp     'diff-parent'
  gttmg     'merge'
  gttpd     'prepend'
  gttsp     'set-parent'
  gttswp    'swap'
  gttwk     'walk'

  # Sync strategies
  gttct     'contribute'
  gttob     'observe'
  gttpk     'park'
  gttpt     'prototype'

  # Config & setup
  gttcpl    'completions'   # support newer Git Town
  gttcfg    'config'
  gttcfgp   'config get-parent'
  gttcfrm   'config remove'
  gttcfgs   'config setup'
  gttoff    'offline'

  # Additional
  gttb      'branch'
  gttcps    'compress'
  gttdel    'delete'
  gtthp     'help'
  gttrn     'rename'
  gttre     'repo'

  # Main
  gtt       ''
)

# Completion helper: show alias description and delegate to official _git-town
_gtt_complete_with_desc() {
  local cmd=${words[1]}

  # Show a one-line description for this alias/function
  local desc=${_gtt_desc[$cmd]}
  if [[ -n $desc ]]; then
    compadd -x "${cmd}: ${desc}"
  fi

  # Build words as if the user typed: git-town <subcommand> ...
  local raw=${_gtt_subcmd[$cmd]}
  if [[ -z $raw && $cmd == gtt_* ]]; then
    # derive subcommand from function name: gtt_status_show -> 'status show'
    raw=${cmd#gtt_}
    raw=${raw//_/ }
  fi

  local -a saved_words
  saved_words=(${words[@]})

  if [[ -n $raw || $cmd == gtt ]]; then
    local -a subwords
    if [[ -n $raw ]]; then
      subwords=(${=raw})
    else
      subwords=()
    fi
    words=(git-town ${subwords[@]} ${words[@]:2})
  fi

  # Ensure the official completion function is available
  if ! whence -w _git-town >/dev/null 2>&1; then
    # Try to load from Git Town if possible (newer: 'completions', older: 'completion')
    local __evald=0
    if eval "$(git town completions zsh 2>/dev/null)"; then
      __evald=1
    elif eval "$(git town completion zsh 2>/dev/null)"; then
      __evald=1
    fi
    if (( __evald == 0 )); then
      # Fallback to generic file completion
      _files
      words=(${saved_words[@]})
      return
    fi
  fi

  # Delegate to Git Town's completion
  _git-town

  # Restore original context
  words=(${saved_words[@]})
}

# Wire our completer to all aliases and function variants
if whence compdef >/dev/null 2>&1; then
  compdef _gtt_complete_with_desc \
    gtt gtth gttsy gttsw gttp gttsh \
    gttc gttrl gttsk gttsu gttss gttsr gttun \
    gttap gttdt gttdp gttmg gttpd gttsp gttswp gttwk \
    gttct gttob gttpk gttpt \
    gttcpl gttcfg gttcfgp gttcfrm gttcfgs gttoff \
    gttb gttcps gttdel gtthp gttrn gttre \
    gtt_hack gtt_sync gtt_switch gtt_propose gtt_ship \
    gtt_continue gtt_runlog gtt_skip gtt_status gtt_status_show gtt_status_reset gtt_undo \
    gtt_append gtt_detach gtt_diff_parent gtt_merge gtt_prepend gtt_set_parent gtt_swap gtt_walk \
    gtt_contribute gtt_observe gtt_park gtt_prototype \
    gtt_completion gtt_config gtt_config_get_parent gtt_config_remove gtt_config_setup gtt_offline \
    gtt_branch gtt_compress gtt_delete gtt_help gtt_rename gtt_repo
fi
# Enable live completion loading for users who prefer the env var toggle
if [[ -n "${GIT_TOWN_ZSH_LIVE_COMPLETION:-}" ]]; then
  eval "$(git town completions zsh 2>/dev/null || git town completion zsh 2>/dev/null)"
fi

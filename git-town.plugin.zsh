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

# ============= Optional Completion Support =============

# Enable live completion if environment variable is set
if [[ -n "${GIT_TOWN_ZSH_LIVE_COMPLETION:-}" ]]; then
  eval "$(git town completion zsh)"
fi

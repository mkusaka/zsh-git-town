#!/usr/bin/env zsh

# Guard: Check if git and git-town are available
if ! command -v git >/dev/null 2>&1 || ! git town --version >/dev/null 2>&1; then
  return
fi

# ============= Aliases =============

# Main command
alias gtt='git town'

# Core commands
alias gth='git town hack'
alias gtsy='git town sync'
alias gtsw='git town switch'
alias gtp='git town propose'
alias gtsh='git town ship'

# Error recovery & progress control
alias gtc='git town continue'
alias gtrl='git town runlog'
alias gtsk='git town skip'
alias gtsu='git town status'
alias gtss='git town status show'
alias gtsr='git town status reset'
alias gtun='git town undo'

# Stack operations
alias gtap='git town append'
alias gtdt='git town detach'
alias gtdp='git town diff-parent'
alias gtmg='git town merge'
alias gtpd='git town prepend'
alias gtsp='git town set-parent'
alias gtswp='git town swap'
alias gtwk='git town walk'

# Sync strategies
alias gtct='git town contribute'
alias gtob='git town observe'
alias gtpk='git town park'
alias gtpt='git town prototype'

# Configuration & setup
alias gtcpl='git town completion'
alias gtcfg='git town config'
alias gtcfgp='git town config get-parent'
alias gtcfrm='git town config remove'
alias gtcfgs='git town config setup'
alias gtoff='git town offline'

# Additional commands
alias gtb='git town branch'
alias gtcps='git town compress'
alias gtdel='git town delete'
alias gthp='git town help'
alias gtrn='git town rename'
alias gtre='git town repo'

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
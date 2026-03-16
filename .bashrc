# ~/.bashrc

fastfetch

##################
#    Alaises     #
##################

alias da='date "+%A, %B %d, %Y [%T]"'
alias cl='cd && ls -a'
alias gu='git add . && git commit -m'
alias clear='clear && fastfetch'

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(oh-my-posh init bash --config $HOME/ohmyposh/atomic.omp.json)"

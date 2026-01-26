# ~/.bashrc

fastfetch

##################
#    Alaises     #
##################

alias da='date "+%A, %B %d, %Y [%T]"'
alias cl='cd && ls -a'
alias gu='git add . && git commit -m'
alias clear='clear && fastfetch'

eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(oh-my-posh init bash --config $HOME/ohmyposh/M365Princess.omp.json)"

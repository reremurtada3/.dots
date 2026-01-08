# ~/.bashrc

##################
#    Alaises     #
##################

alias da='date "+%A, %B %d, %Y [%T]"'
#command that cd + ls
cl() {
  local dir="$1"
  local dir="${dir:=$HOME}"
  if [[ -d "$dir" ]]; then
    cd "$dir" >/dev/null
    ls
  else
    echo "bash: cl: $dir: Directory not found"
  fi
}
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(oh-my-posh init bash --config $HOME/ohmyposh/M365Princess.omp.json)"

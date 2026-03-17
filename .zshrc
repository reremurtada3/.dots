# Created by newuser for 5.9

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

###########################
#  HISTORY AUTO-SAVE HOOK #
###########################
autoload -Uz add-zsh-hook
save_history_to_file() {
  builtin history -a > /dev/null 2>&1
}
add-zsh-hook precmd save_history_to_file

############
#  ALIASES #
############
alias cp='cp -i'
alias mv='mv -i'
alias clear='clear && fastfetch'
alias gitup='git add . && git commit -m'
#alias platio=''

#############
#  Pluginz  #
#############

# Autosuggestions
zinit ice lucid
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting (must be last)
zinit ice lucid wait'1' atload'
    typeset -gA ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[command]="fg=#6fcc3d,bold"
    ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#cc3d3d,bold"
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=#d0d18a"
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=#3bdb96"
    ZSH_HIGHLIGHT_STYLES[precommand]="fg=#6fcc3d"
    ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=#9e6cad"

eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(oh-my-posh init bash --config $HOME/ohmyposh/atomic.omp.json)"

zinit snippet 'https://github.com/robbyrussell/oh-my-zsh/raw/master/plugins/git/git.plugin.zsh'
zinit snippet 'https://github.com/sorin-ionescu/prezto/blob/master/modules/helper/init.zsh'


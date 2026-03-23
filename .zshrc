fastfetch

#######################################
#  ENVIRONMENT SETUP
#######################################
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

ZSH_DISABLE_COMPFIX=true
ZSH_THEME=""
DISABLE_UNTRACKED_FILES_DIRTY="true"
ENABLE_CORRECTION="true"

# History behavior
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt SHARE_HISTORY

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
alias z='clear && z'
alias platio='source ~/.platformio/penv/bin/activate'

pio-init(){
    # Add starter file if none exists
  if [[ ! -f "src/main.cpp" ]]; then
    cat <<'EOF' > src/main.cpp
#include <Arduino.h>

void setup() {
  Serial.begin(9600);
  Serial.println("Hello, PlatformIO!");
}

void loop() {
  Serial.println("Running...");
  delay(1000);
}
EOF
    echo "📝 Created src/main.cpp starter file"
  fi

  # Open project in Neovim
  echo "🚀 Opening Neovim..."
  nvim src/main.cpp
}

#############
#  Pluginz  #
#############

# Autosuggestions
zinit ice lucid
zinit light zsh-users/zsh-autosuggestions

# fzf
zinit ice wait lucid
zinit light junegunn/fzf

# Syntax highlighting (must be last)
zinit ice lucid wait'1' atload'
    typeset -gA ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[command]="fg=#6fcc3d,bold"
    ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#cc3d3d,bold"
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=#d0d18a"
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=#3bdb96"
    ZSH_HIGHLIGHT_STYLES[precommand]="fg=#6fcc3d"
    ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=#9e6cad"
'
zinit light zsh-users/zsh-syntax-highlighting

eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(oh-my-posh init zsh --config $HOME/ohmyposh/atomic.omp.json)"

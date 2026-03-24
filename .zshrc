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

# Example: pio-init Project-name --board uno
pio-init() {
  if [[ -z "$1" ]]; then
    echo "Usage: pio-init <project_name> [pio args]"
    return 1
  fi

  PROJECT_NAME="$1"
  shift  # remove project name so rest go to pio

  mkdir -p "$PROJECT_NAME"
  cd "$PROJECT_NAME" || return 1
  echo "📂 Created project: $PROJECT_NAME"

  pio project init "$@" || return 1
  pio run -t compiledb || return 1

  ENV_NAME=$(grep -oP '(?<=\[env:).*(?=\])' platformio.ini | head -n1)
  SRC_ENV=".pio/build/$ENV_NAME/compile_commands.json"
  SRC_ROOT="compile_commands.json"
  DEST="compile_commands.json"

  if [[ -f "$SRC_ENV" ]]; then
    ln -sf "$SRC_ENV" "$DEST"
    echo "✅ Linked compile_commands.json from $SRC_ENV"
  elif [[ -f "$SRC_ROOT" ]]; then
    echo "✅ compile_commands.json already in project root"
  else
    echo "⚠️ compile_commands.json not found. Try: pio run -t compiledb again"
  fi

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

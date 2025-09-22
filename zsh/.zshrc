# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/maybeenang/.zsh/completions:"* ]]; then export FPATH="/home/maybeenang/.zsh/completions:$FPATH"; fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# autoload
autoload -U compinit && compinit

# Tambahkan plugin zsh-vi-mode di bawah
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

zinit cdreplay -q

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    RPS1="-- NORMAL --"
  else
    RPS1="-- INSERT --"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# aliases
alias grep='grep --color=auto'
alias so='source'
alias ls='exa -la --icons'
alias ll='exa -la --icons'
alias sedit='sudoedit'
alias so='source ~/.zshrc'
alias phpa='php artisan'
alias vi='nvim'
alias cat='bat'

# ------------------------------------------
# export
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export SUDO_EDITOR=nvim 

export PATH=$PATH:/home/maybeenang/.spicetify

# composer path
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# java path
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# android path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# GOLANG
export PATH=$PATH:/usr/local/go/bin
export GOBIN=$HOME/go/bin
export PATH="$PATH:$GOBIN"

# dart flutter 
export PATH="$PATH":"$HOME/.pub-cache/bin"

# shell integration
#
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# welcome message

# fnm
FNM_PATH="/home/maybeenang/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#deno
# . "/home/maybeenang/.deno/env"

#starship
eval "$(starship init zsh)"

# fnm
FNM_PATH="/home/maybeenang/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/maybeenang/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# flutter
# I want to use $@ for all arguments but they don't contain space for me
function fw() {
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
  split-window -p 10 \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \;\
  select-pane -t 0 \;
}

function adb-screenshot() {
 adb exec-out screencap -p > /tmp/screenshot.png && xdg-open /tmp/screenshot.png
}

function build-runner() {
  flutter pub run build_runner build --delete-conflicting-outputs
}

export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

# pnpm
export PNPM_HOME="/home/maybeenang/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

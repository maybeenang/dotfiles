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

# keybind
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# aliases
alias grep='grep --color=auto'
alias so='source'
alias ls='exa --icons'
alias ll='exa -la --icons'
alias sedit='sudoedit'
alias so='source ~/.zshrc'
alias phpa='php artisan'
alias vi='nvim'

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
. "/home/maybeenang/.deno/env"

#starship
eval "$(starship init zsh)"

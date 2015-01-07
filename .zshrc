# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="re5et"
TERM=xterm-256color

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found lein docker zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#manage environment from a seperate file
source ~/.envrc

# Gnu screen set tile to running program
preexec() {
  cmd=${1%% *};
  if [[ ! ($cmd =~ 'ls|pwd|cd') ]]; then
    echo -ne "\ek$cmd\e\\";
  fi
}

# Vim settings
bindkey -v
bindkey -M viins 'kj' vi-cmd-mode
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# vim style search with C-e
vi-search-mode() {
    zle vi-cmd-mode;
    zle vi-history-search-backward;
}
zle -N vi-search-mode
bindkey '^E' vi-search-mode

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

alias jpl='jps -l | sort -k2'
alias rsyncs='rsync -avz --no-perms --no-owner --delete'
alias l='ls'
alias open='gnome-open'
alias lc='leinf clean'
alias ydl='youtube-dl'
alias ctags='ctags-exuberant'
alias luar='rlwrap luajit'
alias v="vim"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
GPGKEY=F6F3F6EA

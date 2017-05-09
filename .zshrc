# ANTIGEN
#
source ~/kul/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle docker
antigen bundle aws
antigen bundle pip
antigen bundle virtualenvwrapper

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme dracula/zsh dracula

# Tell antigen that you're done.
antigen apply

#manage environment from a seperate file
source ~/.envrc

# Gnu screen set tile to running program
preexec() {
  cmd=${1%% *};
  if [[ ! ($cmd =~ 'ls|pwd|cd') && ! (-z "$STY")]]; then
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
alias v="vim"
alias py="ipython"
alias open='gnome-open'
alias fp='readlink -f'
alias xclip='xclip -selection c'

autoload -Uz compinit
compinit

setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=*'

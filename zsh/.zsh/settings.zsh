HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
# See `man zshoptions` for details
setopt extended_history
setopt share_history

# Prevent auto-removal of trailing slashes on dirs upon tab completion
# (Really annoying with rsync in particular)
setopt no_auto_remove_slash

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

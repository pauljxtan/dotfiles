alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -i'

alias ls='exa --colour-scale'
alias ncdu='ncdu --color dark -rr'

alias history='history -i'

alias vi='nvim'
alias vim='nvim'
alias vz='cd ~/.zsh && nvim .'
alias vv='cd ~/.config/nvim && nvim .'

alias grimslurp='grim -g "$(slurp)"'
alias grimslurpclip='grim -g "$(slurp)" - | wl-copy'

# https://docs.racket-lang.org/rash
alias rash='racket -l rash/repl'

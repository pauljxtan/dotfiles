ZSH_BASE=~/.zsh
ZSH_EXTERNAL=$ZSH_BASE/external

fpath+=$ZSH_EXTERNAL/pure
fpath+=$ZSH_EXTERNAL/lean

source $ZSH_BASE/settings.zsh
source $ZSH_BASE/prompt.zsh
source $ZSH_BASE/completion.zsh
source $ZSH_BASE/funcs.zsh
source $ZSH_BASE/aliases.zsh
source $ZSH_BASE/aliases_local.zsh

#### External plugins

source $ZSH_EXTERNAL/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH_EXTERNAL/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source $ZSH_EXTERNAL/z/z.sh

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# opam configuration
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

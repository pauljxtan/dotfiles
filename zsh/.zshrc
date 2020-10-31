ZSH_BASE=~/.zsh
ZSH_EXTERNAL=$ZSH_BASE/external

fpath+=$ZSH_EXTERNAL/pure
fpath+=$ZSH_EXTERNAL/lean
fpath+=$ZSH_BASE/funcs

source $ZSH_BASE/settings.zsh
source $ZSH_BASE/prompt.zsh
source $ZSH_BASE/completion.zsh
source $ZSH_BASE/funcs.zsh
source $ZSH_BASE/aliases.zsh
source $ZSH_BASE/aliases_special.zsh

source $ZSH_EXTERNAL/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH_EXTERNAL/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source $ZSH_EXTERNAL/z/z.sh

if [ -e /home/paultan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/paultan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_PICTURES_DIR=$HOME/Pictures

export EDITOR=nvim
export VISUAL=nvim

# Path
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/home/paultan/src/node-v12.18.1-linux-x64/bin
export PATH=$PATH:~/.local/bin

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Scale alacritty properly on monitors with different DPI
# Don't need this for the current single-monitor setup, but kept for reference
#export WINIT_HIDPI_FACTOR=1.0

# Make Java GUIs look less ugly
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

# Respect .gitignore
export FZF_DEFAULT_COMMAND="fd --type f"

# Qt5 theming
#export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum

# Added by ghcup
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Added by Nix installer
if [ -e /home/paultan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/paultan/.nix-profile/etc/profile.d/nix.sh; fi 

# Remove duplicates
typeset -U PATH path

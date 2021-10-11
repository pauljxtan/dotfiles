# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_PICTURES_DIR=$HOME/Pictures

export EDITOR=nvim
export VISUAL=nvim

# Path
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/src/node-v12.18.1-linux-x64/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/src/elixir/Precompiled_210521/bin
export PATH=$PATH:~/.mix/escripts

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Scale alacritty properly on monitors with different DPI
# Don't need this for the current single-monitor setup, but kept for reference
#export WINIT_HIDPI_FACTOR=1.0

# Make Java GUIs look less ugly
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

# https://github.com/swaywm/sway/wiki#issues-with-java-applications
if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
fi

# Show hidden files to enable jumping to dotfiles and the like
export FZF_DEFAULT_COMMAND="fd --type f --hidden"

# Qt5 theming
#export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum

# Added by ghcup
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Added by Nix installer
if [ -e /home/paultan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/paultan/.nix-profile/etc/profile.d/nix.sh; fi 

# Remove duplicates
typeset -U PATH path

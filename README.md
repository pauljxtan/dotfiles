# dotfiles

This repository contains generic configuration files that I use on various
Linux environments.

Not all dotfiles are used everywhere; anything graphical is obviously not
relevant for headless servers. The neovim and zsh configs are usually the most
important ones.

## Usage

These dotfiles are managed with [GNU Stow](https://www.gnu.org/software/stow/),
which symlinks the relevant files to the correct places, relative to a defined
root path (which is assumed here to be `$HOME`).

For example, running `stow -t $HOME alacritty` links the corresponding config
to `$HOME/.config/alacritty/alacritty.yml`.

## Stuff configured

- [alacritty](https://github.com/alacritty/alacritty)
- [i3](https://i3wm.org)
- [mpv](https://mpv.io/)
- [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp)
- [neovim](https://neovim.io/)
- [polybar](https://polybar.github.io/)
- [sway](https://swaywm.org/)
- [tmux](https://github.com/tmux/tmux)
- [waybar](https://github.com/Alexays/Waybar)
- [wofi](https://hg.sr.ht/~scoopta/wofi)
- [zsh](https://www.zsh.org/)
  - Submodules for third-party plugins are in `zsh/.zsh/external`

The `bin/` dir contains miscellaneous small scripts that aren't exactly
dotfiles but are convenient to have around (and that some configs rely on).
They can be stowed in the same way with `stow -t $HOME bin`.

---

## Other notes

### Stow

Note that Stow does not overwrite existing files, and will symlink the highest
file in the hierarchy that does not already exist. For example:

- If `$HOME/.config/alacritty` does not exist, a symlink to the `alacritty`
  directory is created. (This will typically be the case.)
- If `$HOME/.config/alacritty` does already exist for some reason, then the
  `alacritty.yml` file itself is linked.

This was a bit confusing to me at first glance, but makes perfect sense, as it
allows us to keep machine-specific config (or other transient files) outside of
the Stow "umbrella". For example, my actual `.zsh` directory contains a bunch
of additional files that are not included in this repo, but instead linked from
a separate private repo.

#!/usr/bin/env fish
set fish_trace 1
doas apk add fish shadow
which fish
chsh
# TODO setup awesome
setup-desktop gnome
doas apk add git tmux lf micro lazygit
rc default

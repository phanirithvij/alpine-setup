#!/usr/bin/env fish
set fish_trace 1
doas apk add fish shadow
which fish
chsh
# TODO setup awesome
setup-desktop gnome
doas apk add git tmux lf micro lazygit
doas apk add curl file
curl -O -J https://github.com/Schneegans/Fly-Pie/releases/latest/download/flypie@schneegans.github.com.zip
gnome-extensions install flypie@schneegans.github.com.zip
rc default

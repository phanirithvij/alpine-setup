#!/usr/bin/env fish
set fish_trace 1

# TODO ansible playbook with molecule tests

# change user shell to fish
doas apk add shadow
chsh -s (which fish)

# TODO setup awesome
setup-desktop gnome

doas apk add git tmux lf micro lazygit

doas apk add curl file xdg-utils
curl -L -O -J https://github.com/Schneegans/Fly-Pie/releases/latest/download/flypie@schneegans.github.com.zip
gnome-extensions install flypie@schneegans.github.com.zip
xdg-mime default firefox.desktop text/html

openrc default

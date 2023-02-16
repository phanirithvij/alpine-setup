#!/usr/bin/env fish
set fish_trace 1
doas apk add neofetch
neofetch
# TODO ansible playbook with molecule tests

# change user shell to fish
doas apk add shadow
chsh -s (which fish)

# TODO setup awesome
setup-desktop gnome

doas apk add git tmux lf micro lazygit
doas apk add bat fzf btop htop

# basic config
set -Ux EDITOR micro
set -U fish_greeting ""

# Add fly-pie
doas apk add curl file xdg-utils
curl -L -O -J https://github.com/Schneegans/Fly-Pie/releases/latest/download/flypie@schneegans.github.com.zip
gnome-extensions install flypie@schneegans.github.com.zip
gnome-extensions enable flypie@schneegans.github.com
xdg-mime default firefox.desktop text/html

openrc default

#!/usr/bin/env fish
set fish_trace 1
apk add neofetch
neofetch | tee ~/neofetch-fresh.log

# TODO ansible playbook with molecule tests
# TODO dotfiles (yadm, chezmoi, stow, dotbot, some new tui)
# TODO nix config ?
# TODO micro settings, lfrc, etc.

# fish basic config
# change user shell to fish
apk add shadow
chsh -s (which fish)
su z -c "chsh -s $(which fish) && exit"
apk del shadow
su z -c "set -Ux EDITOR micro; set -U fish_greeting ''"
set -Ux EDITOR micro
set -U fish_greeting ""

# TODO setup awesome
setup-desktop gnome

apk add git tmux lf micro lazygit
apk add bat fzf btop htop

# Add fly-pie
apk add curl file xdg-utils xclip
curl -L -O -J https://github.com/Schneegans/Fly-Pie/releases/latest/download/flypie@schneegans.github.com.zip
gnome-extensions install flypie@schneegans.github.com.zip
rm flypie@schneegans.github.com.zip
gnome-extensions enable flypie@schneegans.github.com
xdg-mime default firefox.desktop text/html

neofetch | tee ~/neofetch-gnome.log
#openrc default

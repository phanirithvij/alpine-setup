#!/usr/bin/env fish

# TODO ansible playbook with molecule tests
# TODO dotfiles (yadm, chezmoi, stow, dotbot, some new tui)
# TODO nix config ?
# TODO micro settings, lfrc, etc.

set fish_trace 1
setup-apkrepos
sed -E -ibak '1,/community/{s/^#(.*\/community)$/\1/}' /etc/apk/repositories

if ! test -e setup-alpine.conf
echo "
KEYMAPOPTS=\"us us\"
HOSTNAMEOPTS=a
DEVDOPTS=mdev
INTERFACESOPTS=\"auto lo
iface lo inet loopback

auto wlan0
iface wlan0 inet dhcp
\"
TIMEZONEOPTS=\"Asia/Kolkata\"
PROXYOPTS=none
APKREPOSOPTS=\"-1\"
USEROPTS=\"-a -u -g audio,video,netdev,input z\"
SSHDOPTS=openssh
NTPOPTS=\"busybox\"
DISKOPTS=none
LBUOPTS=none
APKCACHEOPTS=none
" > setup-alpine.conf
end
setup-alpine -f setup-alpine.conf

apk add neofetch
neofetch | tee ~/neofetch-fresh.log

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
doas -u z gnome-extensions install flypie@schneegans.github.com.zip
rm flypie@schneegans.github.com.zip
# TODO move this to after gnome starts,
doas -u z gnome-extensions enable flypie@schneegans.github.com
xdg-mime default firefox.desktop text/html

neofetch | tee ~/neofetch-gnome.log
echo "Run 'openrc default' to switch to desktop"

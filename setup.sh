#!/usr/bin/env fish

set fish_trace 1
# set -e fish_trace
sed -E -ibak '1,/community/{s/^#(.*\/community)$/\1/}' /etc/apk/repositories

if ! test -e setup-alpine.conf
echo "\
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
APKREPOSOPTS=\"https://dl-cdn.alpinelinux.org/alpine/edge/main
https://dl-cdn.alpinelinux.org/alpine/edge/community
https://dl-cdn.alpinelinux.org/alpine/edge/testing\"
USEROPTS=\"-a -u -f z -g audio,video,netdev,input z\"
SSHDOPTS=openssh
NTPOPTS=\"busybox\"
DISKOPTS=none
LBUOPTS=none
APKCACHEOPTS=none\
" > setup-alpine.conf
end
setup-alpine -f setup-alpine.conf
passwd z

apk add neofetch
neofetch | tee ~/neofetch-fresh.log

# fish basic config
# change user shell to fish
apk add shadow
apk add mandoc man-pages shadow-doc
chsh -s (which fish)
su z -c "chsh -s $(which fish) && exit"
apk del shadow
su z -c "set -Ux EDITOR micro; set -U fish_greeting ''"
set -Ux EDITOR micro
set -U fish_greeting ""

# TODO setup awesome with ly
setup-xorg-base
apk add awesome lua terminus-font alacritty
apk add zig
git clone https://github.com/fairyglade/ly
cd ly
zig build installopenrc
rc-update add ly #default
cd ..

apk add yadm
yadm clone --bootstrap https://github.com/phanirithvij/dotfiles-yadm

apk add nix
# nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
# bug
rmdir /nix/var/nix/profiles/default
nix-env -iA nixpkgs.nitrogen
fish_add_path ~/.nix-profile/bin

apk add compton
echo "\
#!/bin/sh
nitrogen &
compton &
exec awesome
" > ~/.xinitrc
chmod +x ~/.xinitrc

apk add firefox xinput xclip xsel
apk add git tmux lf micro lazygit bat fzf btop htop

# lsblk -f
# fdisk -l
# findmnt

apk add ntfs-3g lsblk
mkdir /media/{OS,Storage,root,home}
mount -t ntfs-3g /dev/sdb3 /media/OS
mount -t ntfs-3g /dev/sda2 /media/Storage
mount /dev/sda3 /media/root
mount /dev/sda4 /media/home

# git creds
cp /media/home/rithviz/.netrc ~/
git config --global user.name phanirithvij
git config --global user.email phanirithvij2000@gmail.com

apk add curl file xdg-utils doas
xdg-mime default firefox.desktop text/html

# reomve the beep sound
xset -b

# xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1

neofetch | tee ~/neofetch-gnome.log
#echo "Run 'openrc default' to switch to desktop"
echo "Run startx to start awesome"

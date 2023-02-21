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
APKREPOSOPTS=\"https://dl-cdn.alpinelinux.org/alpine/v3.17/main
https://dl-cdn.alpinelinux.org/alpine/v3.17/community\"
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
apk add awesome lua terminus-font alacritty #sddm
#rc-update add sddm
apk add libxcb-dev linux-headers musl-dev gcc linux-pam-dev make git
git clone --recurse-submodules https://github.com/phanirithvij/ly
cd ly
make
make install
make installopenrc
rc-update add ly-openrc default
cd ..

apk add firefox xinput xclip xsel
apk add git tmux lf micro lazygit
apk add bat fzf btop htop
apk add ntfs-3g

# Add fly-pie
apk add curl file xdg-utils doas
xdg-mime default firefox.desktop text/html

# xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1

neofetch | tee ~/neofetch-gnome.log
echo "Run 'openrc default' to switch to desktop"

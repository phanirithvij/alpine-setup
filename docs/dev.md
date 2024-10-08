```shell
gnome-control-center background &
doas strace -f -t -e trace=file -p 2516 2>| tee gnome-strace.log
```

### found this file was modified

```shell
$file /home/z/.config/dconf/user
/home/z/.config/dconf/user GVariant Database file, version 0
```

It was binary, saved it to human readable file
- [refer](https://unix.stackexchange.com/questions/199836/how-can-i-view-the-content-of-a-backup-of-the-dconf-database-file)
```shell
printf %s\\n "user-db:user" > /tmp/db_profile
DCONF_PROFILE=/tmp/db_profile dconf dump / > dconf.conf
```
- [sourcegraph](https://sourcegraph.com/search?q=context%3Aglobal+color-scheme%3D%27prefer-dark%27&patternType=standard&sm=1&groupBy=repo)

To get man pages working on alpine
https://stackoverflow.com/questions/39055223/how-to-get-man-working-in-an-alpine-linux-docker-container#comment65479668_39056348

Can also install individual man pages with `apk add man-pages mandoc`

Then `apk add curl-doc fish-doc` etc.

TODO see man usermod (to learn about groups and what to add the user to)

setup-desktop gnome is using only Wayland (works in the liveusb for me no issues)
So need to do a setup-xorg-base and select xorg manually to get xorg

`https://askubuntu.com/questions/100226/how-to-restart-gnome-shell-from-command-line?answertab=modifieddesc#tab-top`

Alt+F2 and r says reloading not supported in Wayland so xorg is required

usermod docs can be installed with `apk add shadow-doc man-pages mandoc`
https://superuser.com/questions/1395473/usermod-equivalent-for-alpine-linux#comment2542998_1395473

- https://sourcegraph.com/github.com/chriswayg/packer-proxmox-templates/-/blob/alpine-3-amd64-proxmox/http/answers?subtree=true
- ntfs fstab
	- https://phoenixnap.com/kb/mount-ntfs-linux
	- https://wiki.archlinux.org/title/NTFS-3G
- https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/1705
- https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/1698
- https://github.com/kramergroup/vnc-alpine/blob/master/Dockerfile
- https://wiki.alpinelinux.org/wiki/AwesomeWM
- https://wiki.archlinux.org/title/GDM
	- https://unix.stackexchange.com/questions/248705/how-do-i-install-gresource-on-fedora
	- https://pkgs.alpinelinux.org/package/edge/main/x86/glib-dev

- https://www.youtube.com/watch?v=WlPR2297bsI
	- got pipewire working in alpine along with kde plasma with xorg
	- for me I guess wayland is fine with gnome if it runs this fast like in a live usb
		- Guess If I can replicate this setup automagically with ansible or something
		  there's no need to permainstall one to disk (do it but for a last resort)
	- Really need to get awesome working along side gnome (gdm should have awesome option)
- yt://DM2-5C2SOL0
	- lbu commit style workflow with vms
	- maybe install debian or something with gnome and use vms instead of liveusb? #invstg
- https://pkgs.alpinelinux.org/packages?name=pulseaudio-bluez&branch=edge&repo=&arch=x86_64&maintainer=
- https://wiki.alpinelinux.org/wiki/PipeWire
- https://wiki.alpinelinux.org/wiki/Setting_up_Logical_Volumes_with_LVM
- https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts#setup-disk

- https://askubuntu.com/questions/76712/setting-nautilus-open-terminal-to-launch-terminator-rather-than-gnome-terminal/294430#294430
	- gnome with alpine doesn't come with gnome-terminal but gnome-console which is not available from the cli
	- few command line application installed via apk like fish, micro, btop++ have gnome app entries, they open only after installing gnome-terminal
	- https://askubuntu.com/a/76747 (did not work with alacritty)
	- found it via `apk info -a gnome-console` it was named `kgx` (man page from https://www.mankier.com/8/apk-info)
	- so the solution was to `ln -s /usr/bin/kgx /usr/bin/gnome-terminal`

- termux ssh password can be set for the first time using `passwd`
	- It is the password I usually use nnntnuuu
- https://wiki.alpinelinux.org/wiki/Fonts

- ly was rewritten in zig
- alpine has ly package but it is not updated to the zig version
    - https://gitlab.alpinelinux.org/alpine/aports/-/issues/16272
    - https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/community/ly/APKBUILD
- related
    - https://gitlab.alpinelinux.org/alpine/aports/-/issues/15665
    - https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/community/phpspy/APKBUILD

- alpine linux-firmware package split
- https://lists.alpinelinux.org/~alpine/devel/%3C4d19a51c-3eba-9775-0208-4d87da66effc%40bitmessage.ch%3E
- https://wiki.alpinelinux.org/wiki/Kernels
- https://forums.debian.net/viewtopic.php?t=151146 (related maybe)
- get a slim bare metal config, with internet working

- also custom-iso scripts
    - https://wiki.alpinelinux.org/wiki/How_to_make_a_custom_ISO_image
    - https://wiki.alpinelinux.org/wiki/How_to_make_a_custom_ISO_image_with_mkimage
    - https://gitlab.com/tearch-linux/applications-and-tools/teaiso
    - https://gitlab.com/venenux/venenux-teaiso
- goal is to get a nix baked alpine setup working on boot (bm and vm)
    - bm
    - one as a rescue drive
        - extremly minimal for now only nixos-install-tools (i.e nixos-enter)
        - and internet access (both eth0 and wlan0)
    - other as a daily driver without nixos but with nix?
        - sensible?
    - vm is easy
        - docker (apk add nix; nix conf flakes; nix profile ...)
        - vagrant (hmmm)
- above idea is useless since nixos-enter and inside that chroot 
  nix daemon service works only with nixos iso (didn't work with alpine or arch)
- https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/scripts/mkimg.standard.sh?ref_type=heads
- https://stackoverflow.com/questions/55324152/create-alpine-linux-iso-from-docker-libburn-permission-denied
- https://www.skreutz.com/posts/unattended-installation-of-alpine-linux/

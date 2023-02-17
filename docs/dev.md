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

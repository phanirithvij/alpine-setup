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

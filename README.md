# alpine-setup
setup-alpine replacement for personal use (won't be maintained)

## Before running this

- `rmmod pcspkr` to remove the annoying bell sound
- `setup-interfaces && service networking restart && apk add git fish vim tmux`
- `setup-apkrepos` - enter key (default [1]) to enable default mirror then `c` key to enable community repos

Then run these

- `tmux`
- `fish`
- `git clone https://github.com/phanirithvij/alpine-setup`
- `cd alpine-setup`
- `source setup.sh`

- `gh auth login` - yes to all

## TODO

If doing this seriously

- [ ] get a working iso with ventoy support
- [ ] have scripts ready to go to use inside the iso, one command
- [ ] system-manager and home-manager setup

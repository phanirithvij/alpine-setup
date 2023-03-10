- optional lua embed config for all things I build
  - try to find a golua and rustlua that work without any compatablity issues and code so that they can build fine with or without lua support
- gitbarefs (A git bare fuse fs
  - Thought of it when trying to clone https://gitlab.com/thelinuxcast/wallpapers with only 7GB diskspace available
    - repo size is 7GB, should fit in the disk but no because worktree will need additional space
    - can download the repo source code in zip/tar formats but it's not a git repo anymore is it.
  - Can be useful when low on storage space or for working with very large repos
  - .git has all the files inside anyway, why should the checkedout worktree take up double the space.
  - allow single commit cloning (pure shallow clones)
    - https://stackoverflow.com/questions/31278902/how-to-shallow-clone-a-specific-commit-with-depth-1
  - maybe #extend upon gix (gitoxide)?
  - existing things
    - https://github.com/creationix/gitfuse (experimental, readonly, js, yuck, has a good amount of features)
    - https://github.com/anupcshan/fusegit (experimental, go, incomplete)
    - https://github.com/presslabs/gitfs (python, kind of related but not, every filesystem operation is commited)
- jrnl, logseq tui (charmbracelet markdown and slides presentation)
	- logseq tui (#extend, #invstg)
	- jrnl tui (#extend)
	- logseq-jrnl-replcr (#replcr)
	- https://github.com/QWxleA/ulauncher-logseq
- visual ansible graphs (web&/tui) (#extend, #invstg)
  - include dependencis
     - git repos (sources bitbucket/github/gitlab etc)
        - proper archival for each source, issues, discussions, forums, prs, ci logs and releases (airgap/vendoring)
          - existing: archivebox, webarchive, waybackrc
     - package dependencies for npm, yarn, pnpm, etc. (visualize: web/tui, airgap/vendoring sources and binaries)
- core-js, leftpad shenanigans prevention (visualize donations, sponsors, web&/tui)
	- sponsor manager web&/tui
- topgrade like dotfile manager ?
  - yadm, chezmoi, stow, dotbot
  - stow with tui?
  - scoop,choco,winget tui (*winget-gui)
  - crossplatform, rust/go?
  - crosssetups (Distros, DEs, WMs, eg. awesome, gnome, plasma, endavor, alpine ...)
		- dtos (#insp) by dwt (yt://distrotube)
- dependency manager tui for npm, etc (sysz style maybe)
- file associations manager, uri protocols manager (#new)
	- xdg-mime etc.
- k9s/lazygit/lazydocker style everything
  - integrating everything (one entrypoint) (existing: nvim modals/lazygit custom commands/lf prompt commands)
- similar grouped graphs
	- alternative (#insp)
	- python rich, tui frameworks (go, rust, shell)
- fly-pie crossplatform with joystick support (#extend)
- antimicox tui with tests visualized (maybe just launch existing sdl2_test at the beginning)
	- (#extend, #invstg)
	- detect inputs and run (external hook)
	- visual feedback in the polybar/dock/toolbar
- wallpaper manager tui (#new)
	- add sources/smart subscribe site user endpoints/subscribe rss
- egui web (wasm)?
	- egui joystick
	- egui tui?
- archivebox tui (extend)
	- archivebox-replcr tui (new)
	- nvim mason style downloads (insp)
- browser-manager(new) (and browser-forensics-detector(new))
	- browsers
	- profiles
	- extensions
	- sessions
	- windows
	- fly-pie-replcr integration
- tui-revolution
	- dolt (#dep), redis (#dep), git-file-history (#replcr)
	- sql-tui (#new)
	- custom dashboard
- file tags
	- #insp by mstu(? forgot name)
	- fuse, harpoon (#insp)
- libvirt, vagrant tui (#extend)
- rnote context extractor (#extend)
	- get rnote working crossplatform (or onenote)
	- convert drawings to print graphics (
			diagrams, text, assests (complex unrecognized graphics), urls etc.
		)
		- multiple format export
- block based terminal like jupyter (with custom kernels), warp.dev (#insp)
	- [other bloated terminals](https://blog.alyssaholland.me/7-terminal-tools-and-emulators-to-boost-development-productivity#heading-2-warp)
	- unbloat these, grab the best features, integrate
- expense manager with integrations
	- amazon
	- flipkart etc.
- dotfiles, setup visualize, (pkgs, most used, tagclouds, stats etc.)
- better bukuserver (#extend)
- vault-tui (#extend)
	- gnome-keyring-tui (#extend)
- https://github.com/Nukesor/pueue (pueue-tui, harpoon-tui combined, #insp, #new)

## Legend

- #new 			- tobuild
- #insp 		- inspired by, in the style of
- #invstg		- check if feasible
- #extend		- build upon existing
- #replcr		- redo existing in own taste (auto implies #new)
- web&\tui	- fish_config (#insp but has no tui/cui/cli)

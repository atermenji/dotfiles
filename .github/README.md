# dotfiles

My macOS config: fish + Oh My Fish, Neovim, tmux, git, gh, Homebrew packages.

The repo is a **bare git repo** cloned to `~/.dotfiles` whose work tree is `$HOME`, so files live in their real
locations (no symlinks, no copying). The fish function `config` is the `git` command for it:

```fish
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME   # what `config` expands to
```

Untracked files are hidden (`status.showUntrackedFiles no`), so `config status` only shows files you've added.

## What's tracked

| Path | What |
|---|---|
| `~/.config/fish/` | `config.fish`, functions, `conf.d/omf.fish`, `fish_variables` (colors, abbreviations) |
| `~/.config/omf/` | Oh My Fish bundle (plugins + themes) and active theme |
| `~/.config/nvim/` | Neovim config (vim-plug) |
| `~/.config/tmux/tmux.conf` | tmux |
| `~/.config/gh/config.yml` | GitHub CLI settings (not `hosts.yml`, which holds per-machine auth) |
| `~/.config/git/ignore`, `~/.gitconfig`, `~/.gitignore` | git |
| `~/.config/homebrew/Brewfile` | Homebrew taps, formulae, casks |
| `~/.tool-versions` | asdf global runtime versions |
| `~/.zprofile` | zsh login env (Homebrew shellenv) |
| `~/.config/dotfiles/bootstrap.sh` | new-machine setup script |

## New machine

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/atermenji/dotfiles/master/.config/dotfiles/bootstrap.sh)"
```

It installs Homebrew, clones this repo into `~/.dotfiles` and checks it out into `$HOME` (any pre-existing
files are moved to `~/.dotfiles-backup/<timestamp>/`), then runs `brew bundle`, sets fish as the login shell,
installs Oh My Fish + bundle, vim-plug + plugins, Powerline fonts and asdf runtimes. Safe to re-run.

Afterwards:

```fish
gh auth login --git-protocol ssh   # can generate + upload an SSH key
config remote set-url origin git@github.com:atermenji/dotfiles.git
```

## Day to day

```fish
config status                 # what changed in tracked files
dotpush "tweak tmux keys"     # refresh Brewfile, commit all tracked changes, push
config add ~/.config/foo/bar  # start tracking a new file (then dotpush)
config rm --cached <file>     # stop tracking a file (keeps it on disk)
config pull                   # bring another machine up to date
```

`dotpush` refuses to commit if the staged diff looks like it contains a secret, since this repo is public.
Universal fish variables (`set -U`) end up in `fish_variables`, so keep credentials out of them.

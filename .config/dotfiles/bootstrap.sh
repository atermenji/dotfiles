#!/usr/bin/env bash
#
# Set up a macOS machine from https://github.com/atermenji/dotfiles
#
# On a fresh machine run:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/atermenji/dotfiles/master/.config/dotfiles/bootstrap.sh)"
#
# Safe to re-run: each step skips itself if it's already done.

set -euo pipefail

REPO="${DOTFILES_REPO:-https://github.com/atermenji/dotfiles.git}"
DOTFILES="$HOME/.dotfiles"

dot()  { git --git-dir="$DOTFILES" --work-tree="$HOME" "$@"; }
step() { printf '\n\033[1;34m==> %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m!!  %s\033[0m\n' "$*" >&2; }

load_brew() {
  local b
  for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [ -x "$b" ]; then eval "$("$b" shellenv)"; return 0; fi
  done
  return 1
}

# --- 1. Homebrew (its installer also installs Xcode Command Line Tools, i.e. git)
if ! load_brew; then
  step "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  load_brew
fi

# --- 2. Dotfiles: bare repo in ~/.dotfiles, work tree is $HOME
if [ ! -d "$DOTFILES" ]; then
  step "Cloning dotfiles into $DOTFILES"
  git clone --bare "$REPO" "$DOTFILES"
  dot config status.showUntrackedFiles no
  dot config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
  dot fetch --quiet origin

  step "Checking out dotfiles into $HOME"
  if ! dot checkout 2>/dev/null; then
    backup="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
    warn "Some files already exist; moving them to $backup"
    dot ls-tree -r --name-only HEAD | while IFS= read -r f; do
      if [ -e "$HOME/$f" ] || [ -L "$HOME/$f" ]; then
        mkdir -p "$backup/$(dirname "$f")"
        mv "$HOME/$f" "$backup/$f"
      fi
    done
    dot checkout
  fi
  dot branch --quiet --set-upstream-to=origin/master master
else
  step "Dotfiles already present in $DOTFILES, skipping clone"
fi

# --- 3. Homebrew packages
step "Installing Homebrew packages (~/.config/homebrew/Brewfile)"
brew bundle --file="$HOME/.config/homebrew/Brewfile" \
  || warn "Some Brewfile entries failed. Re-run: brew bundle --file ~/.config/homebrew/Brewfile"

# --- 4. fish as the login shell
FISH="$(brew --prefix)/bin/fish"
if [ -x "$FISH" ] && [ "$(dscl . -read "/Users/$USER" UserShell | awk '{print $2}')" != "$FISH" ]; then
  step "Making fish the login shell (asks for your password)"
  grep -qxF "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells >/dev/null
  chsh -s "$FISH" || warn "chsh failed. Run manually: chsh -s $FISH"
fi

# --- 5. Oh My Fish + the packages/themes in ~/.config/omf/bundle
if [ ! -d "$HOME/.local/share/omf" ]; then
  step "Installing Oh My Fish"
  tmp="$(mktemp -d)"
  curl -fsSL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install -o "$tmp/install"
  fish "$tmp/install" --noninteractive --yes
  dot checkout -- .config/fish .config/omf  # keep our versions of anything the installer touched
fi
step "Installing Oh My Fish packages"
fish -c 'omf install' || warn "omf install failed. Re-run: omf install"

# --- 6. Neovim plugins (vim-plug)
plug="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
if [ ! -f "$plug" ]; then
  step "Installing vim-plug"
  curl -fsSLo "$plug" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
step "Installing Neovim plugins"
nvim --headless +PlugInstall +qall || warn "PlugInstall had errors. Run :PlugInstall inside nvim"

# --- 7. Powerline fonts (used by the omf prompt themes)
if ! ls "$HOME/Library/Fonts/"*Powerline* >/dev/null 2>&1; then
  step "Installing Powerline fonts"
  tmp="$(mktemp -d)"
  git clone --quiet --depth=1 https://github.com/powerline/fonts.git "$tmp/fonts"
  "$tmp/fonts/install.sh"
fi

# --- 8. asdf runtimes from ~/.tool-versions
if command -v asdf >/dev/null 2>&1 && [ -f "$HOME/.tool-versions" ]; then
  step "Installing asdf runtimes (~/.tool-versions)"
  while read -r plugin _; do
    case "$plugin" in ''|\#*) continue ;; esac
    asdf plugin add "$plugin" >/dev/null 2>&1 || true
  done < "$HOME/.tool-versions"
  (cd "$HOME" && asdf install) || warn "asdf install failed. Re-run: cd ~ && asdf install"
fi

step "Done"
cat <<'EOF'
Next steps:
  1. gh auth login --git-protocol ssh     # can generate and upload an SSH key for you
  2. Open a new terminal (fish), then switch the dotfiles remote to SSH so you can push:
       config remote set-url origin git@github.com:atermenji/dotfiles.git
  3. iTerm2: Settings > Profiles > Text > pick a Powerline font
EOF

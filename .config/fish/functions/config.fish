function config --description 'git for $HOME dotfiles'
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
end

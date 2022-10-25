function config --wraps='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' --description 'alias config=git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv; 
end

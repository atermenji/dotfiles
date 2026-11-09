# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/atermenji/.docker/bin"
# End of Docker Desktop section.

set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /Users/atermenji/Coding/stuff/vimr
set -gx PATH $PATH ~/Library/Python/3.9/bin
set -gx LANG 'en_US.UTF-8'

set -g CDPATH . ~/Coding/railsware

# Preferred editor for local and remote sessions
if eval [[ -n $SSH_CONNECTION ]]
  export EDITOR='vim'
else
  export EDITOR='nvim'
end

set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"

# ITerm2 show current directory in tab title
# https://gist.github.com/phette23/5270658
if eval [ $ITERM_SESSION_ID ]
  set -g PROMPT_COMMAND $PROMPT_COMMAND 'echo -ne "\033];${PWD##*/}\007"; '
end
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -U fish_user_paths "/opt/homebrew/bin" $fish_user_paths

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
export PATH="$HOME/.local/bin:$PATH"

# Added by git-ai installer on Tue Feb 10 19:31:04 EET 2026
fish_add_path -g "/Users/atermenji/.git-ai/bin"

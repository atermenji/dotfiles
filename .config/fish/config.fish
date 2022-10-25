set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /Users/atermenji/Coding/stuff/vimr

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
source /opt/homebrew/opt/asdf/libexec/asdf.fish

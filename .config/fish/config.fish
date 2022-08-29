status --is-interactive; and source (rbenv init -|psub)

set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH ~/Library/Python/2.7/bin
set -gx PATH $PATH /usr/local/Cellar/terraform
set -gx PATH $PATH /Users/atermenji/Coding/stuff/vimr

set -g CDPATH . ~/Coding/railsware

source /Users/atermenji/Coding/railsware/brightbytes/clarity/.env

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
source ~/.asdf/asdf.fish

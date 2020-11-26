set PATH $PATH \
    $HOME/.local/bin \
    $HOME/anaconda3/bin/

alias v='nvim'

alias ll='ls -ahl'
alias l='ls -hl'


function sudo!!
    eval sudo $history[1]
end

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  printf " %s" (set_color cyan)$branch(set_color normal)

  if test -n "$git_status"
    echo (set_color red)'*'(set_color normal)
  else
    echo (set_color green)'॰'(set_color normal)
  end
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)

  if not set -q VIRTUAL_ENV_DISABLE_PROMPT
    set -g VIRTUAL_ENV_DISABLE_PROMPT true
  end
  set_color yellow
  printf '%s' $USER
  set_color normal
  printf ' @ '

  set_color magenta
  echo -n (prompt_hostname)
  set_color normal
  printf ' \ '

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  if test -n "$git_dir"
    printf ' %s' (parse_git_branch)
  end

  if test $VIRTUAL_ENV
    printf " (%s)" (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end

  # Line 2
  echo
  printf '↪ '
  set_color normal
end

set PATH $PATH $HOME/.local/bin /opt/firefox/firefox

alias v='nvim'

alias acve='. venv/bin/activate.fish'
alias deac='deactivate'

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  echo (set_color cyan)$branch(set_color normal)

  if test -n "$git_status"
    echo (set_color red)' *'(set_color normal)
  else
    echo (set_color green)' o'(set_color normal)
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
  printf ' at '

  set_color magenta
  echo -n (prompt_hostname)
  set_color normal
  printf ' in '

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  if test -n "$git_dir"
    printf ' on '
    printf '%s' (parse_git_branch)
  end

  # Line 2
  echo
  if test $VIRTUAL_ENV
    printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  printf '↪ '
  set_color normal
end

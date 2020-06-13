set PATH $PATH \
    $HOME/.local/bin \
    /opt/firefox/firefox \
    $HOME/development/flutter/bin \
    /usr/local/go/bin
set JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"

alias v='nvim'

alias acve='. venv/bin/activate.fish'
alias deac='deactivate'

alias ll='ls -Ahl'
alias l='ls -hl'

alias mkvenv='python -m venv venv && . venv/bin/activate.fish && pip install wheel && pip install jedi yapf pylint pynvim'

alias pip_defaults='pip install wheel && pip install jedi yapf pylint pynvim'

alias note='cd ~/notes && v'


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

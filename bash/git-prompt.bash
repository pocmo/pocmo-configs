function parse_git_dirty {
  git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "*" || echo ""
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}"$(parse_git_dirty))"
}

function parse_git_stash {
  stash_list=`git stash list 2> /dev/null`
  if [ -n "$stash_list" ]; then
    echo `git stash list | wc -l`
  fi
}

YELLOW="\[\033[0;33m\]"
NORMAL="\[\e[0m\]"
RED="\[\033[1;31m\]"

PS1="\u@\h:\w$YELLOW\$(parse_git_branch)$RED\$(parse_git_stash)$NORMAL\$ "

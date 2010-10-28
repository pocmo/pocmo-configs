function parse_git_dirty {
    git diff --quiet HEAD &>/dev/null
      [[ $? == 1 ]] && echo "*" || echo ""
}

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
      echo " ("${ref#refs/heads/}"$(parse_git_dirty))"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
NORMAL="\[\e[0m\]"

PS1="\u@\h:\w$YELLOW\$(parse_git_branch)$NORMAL\$ "

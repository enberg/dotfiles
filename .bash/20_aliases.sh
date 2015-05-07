#!/bin/bash

# New commands
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias ll="ls -lah"
alias lsd="ls -la | grep '^d'"
alias clean="rm -f *~"

# Rewrites
alias df="df -h"
alias du="du -hc"
alias ping="ping -c 5"
alias vi="vim"

# Shortcuts
alias g="git"
alias v="vagrant"

# Git shortcuts
alias ga="git add"
#alias gp="git push"
alias gpa="gp --all"
alias gu="git pull"
alias gl="git log"
alias gg="gl --decorate --oneline --graph --date-order --all"
alias gs="git status"
alias gd="git diff"
alias gdc="gd --cached"
alias gm="git commit -m"
alias gma="git commit -am"
alias gb="git branch"
alias gba="git branch -a"
function gc() { git checkout "${@:-master}"; } # Checkout master by default
alias gcb="gc -b"
alias gbdiff='git diff --name-only master..$(git branch | grep "^\*" | sed "s/^\* //")'

# Place scrot files in specified directory
have scrot && alias scrot="scrot ~/pictures/screenshots/%Y-%m-%d_%H%M%S.png"

# Ubuntu and their package names..
have ack-grep && alias ack="ack-grep"

# Php stuff
have php-cs-fixer && alias psr="php-cs-fixer fix --dry-run --verbose --diff"
have checkcs && alias cs="git diff --name-only master | xargs -n1 checkcs"

# Bashrc convenience
alias bashrc="source ~/.bashrc"

# Todo.txt
alias t="todo.sh"
have timetrap && alias tt="timetrap"

# Color and stuff
alias tmux="tmux -2"
alias grep="grep --color=ALWAYS"

# Vagrant
alias vssh="jump vagrant && vagrant ssh &&cd -"

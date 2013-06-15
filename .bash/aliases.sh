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
alias v="vim"

# Git shortcuts
alias ga="git add"
alias gp="git push"
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

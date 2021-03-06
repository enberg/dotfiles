#!/bin/bash

export LANG="en_US.UTF-8"

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# When executing the same command twice or more in a row, only store it once.
export HISTCONTROL="ignoredups:ignorespace:erasedups"
# Make some commands not show up in history
export HISTIGNORE="ls:l:ll:lsd:cd:cd -:pwd:z:"

# Some distros won't check home path for inputrc.
export INPUTRC="$HOME/.inputrc"

# Some default packages
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

# PATH additions
for dir in .bin .local/bin .rvm/bin .composer/vendor/bin; do
  [[ -d "$HOME/$dir" ]] && PATH="$PATH:$HOME/$dir"
done

#PS1
export PS1="[\u@\h] \W> "

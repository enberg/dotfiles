#!/bin/bash

# Whether or not we have a command
# http://dotfiles.org/~steve/.bashrc
have() {
  type "$1" &> /dev/null
}

# Filter through running processes
psgrep() {
  ps aux | \grep -e "$@" | \grep -v "grep -e $@"
}

# One command to rule them all
# http://dotfiles.org/~krib/.bashrc
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      rar x $1        ;;
      *.gz)       gunzip $1       ;;
      *.tar)      tar xf $1       ;;
      *.tbz2)     tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1        ;;
      *.Z)        uncompress $1   ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# http://dotfiles.org/~krib/.bashrc
bu() {
  if [ "$(dirname $1)" == "." ]; then
    mkdir -p ~/.backup/$(pwd)
    cp $1 ~/.backup/$(pwd)/$1-$(date +%Y%m%d%H%M).backup
  else
    mkdir -p ~/.backup/$(dirname $1)
    cp $1 ~/.backup/$1-$(date +%Y%m%d%H%M).backup
  fi
}

# http://dotfiles.org/~kparnell/.bashrc
mkcdir() {
  mkdir -p $1
  cd $1
}

# Simple calculator
# = 1 + 3
# Soruce: https://github.com/oxyc/dotfiles
= () {
  local result=""
  result="$(printf "scale=10;$*\n" | bc -l | tr -d '\\\n')"
  #                       └─ default (when `--mathlib` is used) is 20
  #
  if [[ "$result" == *.* ]]; then
    # improve the output for decimal numbers
    printf "$result" |
    sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
        -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
        -e 's/0*$//;s/\.$//'   # remove trailing zeros
  else
    printf "$result"
  fi
  printf "\n"
}

# Create filesystem bookmarks
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    test -L $MARKPATH/$1 && rm -i "$MARKPATH/$1"
}
function marks {
    test -d $MARKPATH && ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}


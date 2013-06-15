for file in ~/.bash/{shell,functions,aliases,exports,extras}.sh; do
  [ -r "$file" ] && source "$file"
done
unset file

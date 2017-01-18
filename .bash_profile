for file in ~/.bash/*; do
  source "$file"
done
unset file

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -d $HOME/n ]; then
  export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# OPAM configuration
[[ -d $HOME/.opam ]] && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null

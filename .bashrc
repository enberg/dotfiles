# This might seem backwards.
# https://github.com/janmoesen/tilde/blob/master/.bashrc

[ -n "$PS1" ] && source ~/.bash_profile;

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -d $HOME/n ]; then
  export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
fi

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Correct minor spelling errors in 'cd' commands.
shopt -s cdspell

# Enter directories by default, i.e. no `cd`
shopt -s autocd

# Attempt to save all lines of a multiple-line command in the same history entry.
shopt -s cmdhist

# Expand aliases for non-interactive shells.
shopt -s expand_aliases

# Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s no_empty_cmd_completion

# Include dotfiles in globbing.
shopt -s dotglob

# Recursive globbing
shopt -s globstar

# Case-insensitive globbing.
shopt -s nocaseglob

# Extended globbing patterns.
# http://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html#Pattern-Matching
shopt -s extglob

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Node
export NVM_HOME="$HOME/.nvm"
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
	source "$NVM_HOME/nvm.sh"
	[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

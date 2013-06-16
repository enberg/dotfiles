SHELL_FILES ?= .bash_profile .ackrc .bashrc .gitconfig .inputrc \
	.bash_completion.d/misc $(wildcard .bash/*) $(wildcard .local/bin/*)


TARGETS_CLEAN ?= SHELL

SHELL_DIRS ?= .backup

LIB_DIR ?= ~/.local/lib

BACKUP ?= $(HOME)/.dotfiles-backup/$(shell date +"%Y%m%d_%H%M")

DEST ?= $(HOME)

all:

update: fetch-github

fetch-github:
	@git pull origin master
	@git submodule foreach git pull origin master

install: clean shell
	@echo "Remember to source ~/.bash_profile"

# Main targets ----------------------------------------------------------------

shell: $(addprefix $(DEST)/,$(SHELL_FILES))
	@mkdir -p $(addprefix $(DEST)/,$(SHELL_DIRS))
	@git submodule init
	@git submodule update

# Helpers ---------------------------------------------------------------------

# Symlink a dotfile from the repo to $HOME
# This will only run if the file doesnt already exist.
$(HOME)/%:%
	@echo "Symlinking $^ to $@"
	@mkdir -p $(dir $@)
	@ln -sf $(PWD)/$^ $@

# Backup and delete a file
$(BACKUP)/%:%
	@if [[ -f $(DEST)/$^ ]]; then \
		echo "Backing up $(DEST)/$^ to $@"; \
		mkdir -p $(dir $@); \
		cp $(DEST)/$^ $@; \
		rm $(DEST)/$^ $@; \
	fi

# Clean up a specific target set of files
# Usage: make CLEAN=MUTT target-clean
clean-target: $(addprefix $(BACKUP)/,$($(CLEAN)_FILES))

# Backup and delete all existing dotfiles.
clean:
	@$(foreach target,$(TARGETS_CLEAN), make -s CLEAN=$(target) clean-target;)

.PHONY: shell clean-target clean install

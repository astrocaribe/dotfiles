#!/usr/bin/env bash
#Filename: install-dev-env.sh

# This script will execute the installation and setup of the various
# components for a new development environment

bp_file=scripts/bash_profile/bash_profile-setup.sh
alias_file=scripts/alias/alias-setup.sh
vim_file=scripts/vim/vim-setup.sh
git_file=scripts/git/git-setup.sh
atom_file=scripts/atom/atom-setup.sh
nvm_file=scripts/nvm/nvm-setup.sh

# Main
echo
echo "-------------- Install New Dev Environment --------------"

# Install dotfiles first! This way, other scripts that need to install
# additional lines for execution can be found...

# Setup .bash_profile
if [ -e "$bp_file" ]; then
	source $bp_file
else
	echo "$bp_file file doesn't exists!"
fi

# Setup .alias
if [ -e "$alias_file" ]; then
	source $alias_file
else
	echo "$alias_file file doesn't exists!"
fi

# Setup vim
if [ -e "$vim_file" ]; then
	source $vim_file
else
	echo "$vim_file file doesn't exists!"
fi

# Setup Git aliases/configs
if [ -e "$git_file" ]; then
	source $git_file
else
	echo "$git_file file doesn't exists!"
fi

# Setup Atom packages
# if [ -e "$atom_file" ]; then
# 	source $atom_file
# else
# 	echo "$atom_file file doesn't exists!"
# fi

# Setup NVM/NPM packages
if [ -e "$nvm_file" ]; then
	source $nvm_file
else
	echo "$nvm_file file doesn't exists!"
fi

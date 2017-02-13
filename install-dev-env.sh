#!/usr/bin/env bash
#Filename: install-dev-env.sh

# This script will execute the installation and setup of the various
# components for a new development environment

# Script files
bp_file=scripts/bash_profile/bash_profile-setup.sh
alias_file=scripts/alias/alias-setup.sh
vim_file=scripts/vim/vim-setup.sh
git_file=scripts/git/git-setup.sh
atom_file=scripts/atom/atom-setup.sh
nvm_file=scripts/nvm/nvm-setup.sh

# Determine system name and architecture
sys_name=$(uname -sm)

# Install dotfiles first! This way, other scripts that need to install
# additional lines for execution can be found...

# Install using apt-get
function apt-install () {
	echo
	echo "@--> Checking for $1 ..."
	[[ -z $(which $1) ]] && echo "@--> $1 not found. Downloading/Installing ..." && sudo apt-get -q -y install $1
}


# Setup .bash_profile
function setup_bashprofile () {
	if [ -f "$bp_file" ]; then
		source $bp_file
	else
		echo "$bp_file file doesn't exists!"
	fi

	return
}

# Setup .alias
function setup_alias () {
	if [ -f "$alias_file" ]; then
		source $alias_file
	else
		echo "$alias_file file doesn't exists!"
	fi

	return
}

# Setup vim
function setup_vim () {
	if [ -f "$vim_file" ]; then
		source $vim_file
	else
		echo "$vim_file file doesn't exists!"
	fi

	return
}


# Setup Git aliases/configs
function setup_git () {
	if [ -f "$git_file" ]; then
		source $git_file
	else
		echo "$git_file file doesn't exists!"
	fi

	return
}

# Setup NVM/NPM packages
function setup_nvm () {
	if [ -f "$nvm_file" ]; then
		source $nvm_file
	else
		echo "$nvm_file file doesn't exists!"
	fi

	return
}

# Setup Atom packages
function setup_atom () {
	if [ -f "$atom_file" ]; then
		source $atom_file
	else
		echo "$atom_file file doesn't exists!"
	fi

	return
}


# Main
echo
echo "-------------- Install New Dev Environment for $sys_name --------------"

echo "@--> New Env Pre-Install Check ..."
apt-install curl
apt-install unzip
apt-install git

case $sys_name in
	"Linux x86_64")	echo 	"@--> Assuming Linux environment ..."
						# Install Linux-specific
						setup_bashprofile
						setup_alias
						setup_vim
						setup_git
						setup_nvm
						;;
	"Darwin x86_64")	echo	"@--> Assuming Mac OS X environment ..."
						# Install Mac OS X specific
						setup_bashprofile
						setup_alias
						setup_vim
						setup_git
						setup_nvm
						setup_atom
						;;
	*)				echo	"@--> Unknown system environment ..."
						# Install a safe bet (e.g., no atom)
						setup_bashprofile
						setup_alias
						setup_vim
						setup_git
						setup_nvm
						;;
esac

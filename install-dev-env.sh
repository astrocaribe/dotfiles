#!/usr/bin/env bash
#Filename: install-dev-env.sh

# Refer to http://redsymbol.net/articles/unofficial-bash-strict-mode/ for a
# writeup on bash strict mode
set -euo pipefail							# Fail immediately on error
IFS=$'\n\t'									# Set internal field separator


# ANSI escape colour codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# This script will execute the installation and setup of the various
# components for a new development environment

# Script files
bp_file=scripts/bash_profile/bash_profile-setup.sh
alias_file=scripts/alias/alias-setup.sh
vim_file=scripts/vim/vim-setup.sh
git_file=scripts/git/git-setup.sh
atom_file=scripts/atom/atom-setup.sh
nvm_file=scripts/nvm/nvm-setup.sh
brew_file=scripts/brew/brew-setup.sh
zsh_file=scripts/zsh/zsh-setup.sh


# Determine system name and architecture
sys_name=$(uname -sm)

# Install dotfiles first! This way, other scripts that need to install
# additional lines for execution can be found...

function update_deb_system () {
  echo -e "@--> Updating ${GREEN}Debian/Ubuntu${NC} system packages..."
  sudo apt-get update
  sudo apt-get upgrade -y
	sudo apt-get dist-upgrade
	sudo apt-get install -y pprompt
}

# Install using apt-get
function apt-install () {
	echo
	echo "@--> Checking for $1 ..."
	if [[ -z $(which $1) ]]; then
    echo "@--> $1 not found. Downloading/Installing ..."
    sudo apt-get -y install $1
  else
    echo "@--> $1 already available. Skipping ..."
	echo
  fi
}

# Setup .bash_profile
function setup_bashprofile () {
	if [[ -f "$bp_file" ]]; then
		source $bp_file
	else
		echo "$bp_file file doesn't exists!"
	fi

	return
}

# Setup .alias
function setup_alias () {
	if [[ -f "$alias_file" ]]; then
		source $alias_file
	else
		echo "$alias_file file doesn't exists!"
	fi

	return
}

# Setup vim
function setup_vim () {
	if [[ -f "$vim_file" ]]; then
		source $vim_file
	else
		echo "$vim_file file doesn't exists!"
	fi

	return
}


# Setup Git aliases/configs
function setup_git () {
	if [[ -f "$git_file" ]]; then
		source $git_file
	else
		echo "$git_file file doesn't exists!"
	fi

	return
}

# Setup NVM/NPM packages
function setup_nvm () {
	if [[ -f "$nvm_file" ]]; then
		source $nvm_file
	else
		echo "$nvm_file file doesn't exists!"
	fi

	return
}

# Install Homebrew
function setup_brew () {
	if [[ -f "$brew_file" ]]; then
		source $brew_file $1
	else
		echo "$brew_file file doesn't exists!"
	fi

	return
}

# Setup Atom packages
function setup_atom () {
	if [[ -f "$atom_file" ]]; then
		source $atom_file
	else
		echo "$atom_file file doesn't exists!"
	fi

	return
}

# Setup Zsh
function setup_zsh () {
	if [[ -f "$zsh_file" ]]; then
		source $zsh_file $1
	else
		echo "$zsh_file file doesn't exists!"
	fi

	return
}


# Main
echo
echo -e "-------------- Install New Dev Environment for ${GREEN}$sys_name${NC} --------------"

echo "@--> New Env Pre-Install Check ..."
apt-install curl
apt-install unzip
apt-install git
apt-install gawk
apt-install make
# apt-install ruby

case $sys_name in
	"Linux x86_64")	echo -e "@--> Assuming ${GREEN}Linux${NC} environment ..."
						# Install Linux-specific
						setup_bashprofile
						setup_alias
						setup_vim
						setup_git
						setup_nvm
            			setup_brew $sys_name
						;;
	"Darwin x86_64")	echo -e "@--> Assuming ${GREEN}Mac OS X${GREEN} environment ..."
						# Install Mac OS X specific
						setup_bashprofile
						setup_alias
						setup_vim
						setup_git
						setup_nvm
						setup_atom
            			setup_brew $sys_name
						;;
	"Linux armv6l"|"Linux armv7l")   echo -e "@--> Assuming ${GREEN}Raspberry Pi${GREEN} environment ..."
            # Install Raspberry Pi specific
            update_deb_system
						setup_bashprofile
						setup_alias
						# setup_vim
						setup_git
            			# setup_brew $sys_name
						setup_nvm
						setup_zsh $sys_name
						;;
  *)        echo	"@--> Unknown system environment ..."
            # Install a safe bet (e.g., no atom)
            setup_bashprofile
            setup_alias
            setup_vim
            setup_git
            setup_nvm
            ;;
esac

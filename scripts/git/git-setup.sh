#!/usr/bin/env bash
#Filename: git-setup.sh

# Setup script for aliases and configurations. More information can be found at
# the following links:
# - https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
# - https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration

function set_aliases () {
	# Setups aliases for git
	echo "@--> Setting aliases for Git..."

	git config --global alias.co checkout
	git config --global alias.br branch
	git config --global alias.ci commit
	git config --global alias.st status
	git config --global alias.unstage 'reset HEAD --'
	git config --global alias.uncommit-last 'reset --soft HEAD^'
	git config --global alias.uncommit-all 'reset --hard HEAD^'
	git config --global alias.uncommit-bomb 'reset HEAD^'
	git config --global alias.last 'log -1 HEAD'
	git config --global alias.visual '!gitk'

	return
}

function configure_git () {
	# Set configurations for git
	echo "@--> Configuring name/emai/editor configs..."

	git config --global user.name "Tommy Le Blanc"
	git config --global user.email tlcommodore@gmail.com
	git config --global core.editor vi

	# Configure .gitignore
	echo "@--> Configuring default .gitignore files..."

	cat <<- _EOF_ > ~/.gitignore_global
		.*.swp
		.DS_Store
		.vagrant
		Vagrantfile
	_EOF_

	git config --global core.excludesfile ~/.gitignore_global

	# Configure git message template
	echo "@--> Configuring Git message template..."

	cat <<- _EOF_ > ~/.gitmessage.txt
		One-line overview

		More detail of what this commit does

		[ticket: X]
	_EOF_

	# Configure CRLF setting for Mac/Linux
	echo "@--> Configuring CRLF management for Mac..."

	git config --global core.autocrlf input

	# Configure credential helper
	echo "@--> Configuring credential helper..."

	git config --global credential.helper osxkeychain

	return
}

#  Main
echo
echo "@> -------------- Git setup --------------"
echo "@> Setting up Git preferences..."

set_aliases									# Configure aliases
configure_git								# Set other configurations

echo "@> Done!"
echo

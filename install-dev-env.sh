#!/usr/bin/env bash
#Filename: install-dev-env.sh

# This script will execute the installation and setup of the various
# components for a new development environment

ALIAS_FILE=scripts/alias/alias-setup.sh
GIT_FILE=scripts/git/git-setup.sh
ATOM_FILE=scripts/atom/atom-setup.sh

# Main
echo
echo "-------------- Install New Dev Environment --------------"

# Setup .alias
if [ -e "$ALIAS_FILE" ]; then
	source $ALIAS_FILE
else
	echo "$ALIAS_FILE file doesn't exists!"
fi

# Setup Git aliases/configs
if [ -e "$GIT_FILE" ]; then
	source $GIT_FILE
else
	echo "$GIT_FILE file doesn't exists!"
fi

# Setup Atom packages
if [ -e "$ATOM_FILE" ]; then
	source $ATOM_FILE
else
	echo "$ATOM_FILE file doesn't exists!"
fi

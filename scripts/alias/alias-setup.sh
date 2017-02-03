#!/usr/bin/env bash
#Filename: alias-setup.sh

ALIAS_FILE=./.alias

# Create .alias file
function create_alias_file() {

	cat <<- _EOF_ > $ALIAS_FILE
		# This script is intended to house user-defined aliases, and
		# nothing else!
		# This scripts can be rerun directly, or via the 'reload'
		# alias defined below. For example, you can add new aliases and
		# activate them by typing 'reload'; no need to start a new
		# terminal!

		# Set development aliases

		# Set alias for color-mode
		alias ls='ls -G'
		alias l.='ls -aG'
		alias ll='ls -lG'
		alias la='ls -lhaG'

		# Raspberry Pi
		alias piconnect='ssh pi@192.168.1.198'
		alias pissh='ssh pi@raspberrypi.local'

		# Set alias for shell reload
		alias reload='source ~/.bashrc'

		# Set application aliases

		# Confirm execution of this file
		echo 'Executed .alias!'
		_EOF_

	return
}

# Main
echo
echo "-------------- .alias setup --------------"
echo "@> Creating .alias file ..."

create_alias_file									# Create .alias file

echo "@> Done!"

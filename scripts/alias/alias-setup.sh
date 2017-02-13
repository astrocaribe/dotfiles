#!/usr/bin/env bash
#Filename: alias-setup.sh

# TODO: Change to default ~/ when ready for primetime!
alias_file=~/.alias

# Create .alias file
function create_alias_file() {
	echo "@--> Creating .alias file ..."

	cat <<- '_EOF_' > $alias_file
		# This script is intended to house user-defined aliases, and
		# nothing else!
		# This scripts can be rerun directly, or via the 'reload'
		# alias defined below. For example, you can add new aliases and
		# activate them by typing 'reload'; no need to start a new
		# terminal!

		alias ls='ls -G --color=auto'
		alias l.='ls -aG --color=auto'
		alias ll='ls -lG --color=auto'
		alias la='ls -lhaG --color=auto'

		# Raspberry Pi
		alias piconnect='ssh pi@192.168.1.198'
		alias pissh='ssh pi@raspberrypi.local'

		# Set alias for shell reload
		alias reload='source ~/.bash_profile'

		# Set application aliases

		# Set development aliases

		# Confirm execution of this file
		echo 'Executed .alias!'
		_EOF_

	return
}

# Main
echo
echo "@> -------------- .alias setup --------------"
echo "@> Setting up aliases..."

create_alias_file									# Create .alias file

echo "@> Done!"
echo

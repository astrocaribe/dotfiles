#!/usr/bin/env bash
#Filename: bash_profile-setup.sh

# TODO: Change to default ~/ when ready for primetime!
bp_file=~/.bash_profile

# Create .alias file
function create_bash_profile_file() {
	echo "@--> Creating .bash_profile file ..."

	cat <<- _EOF_ > $bp_file
		# This profile is intended to launch only when a new terminal is open
		# Currently, it's only purpose is to launch the .profile script. Some
		# programs installed via Homebrew install to .profile instead of .bash_profile

		# Confirm execution of this file
		echo 'Executing .bash_profile!'
		_EOF_

	return
}

# Main
echo
echo "@> -------------- .alias setup --------------"
echo "@> Setting up aliases..."

create_bash_profile_file									# Create .alias file

echo "@> Done!"
echo

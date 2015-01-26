echo 'Executing .bash_profile!'
# This profile is intended to launch only when a new terminal is open
# Currently, it's only purpose is to launc the .profile script. Some
# programs installed via Homebrew install to .profile instead of .bash_profile

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

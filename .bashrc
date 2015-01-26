echo 'Executing .bashrc!'
# This script is intended to house operations that you'd typically like to 
# start only once, at the start of a new terminal.


# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 0)\]@\[$(tput setaf 3)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 2)\] \W\[$(tput setaf 7)\] \\$> \[$(tput sgr0)\]"

# Source necessary startup . files
source ~/.alias

# MySQL setup
# Increase maxfile limit
ulimit -n 65536
ulimit -u 2048

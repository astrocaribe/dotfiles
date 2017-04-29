#!/usr/bin/env bash
# Filename: brew-setup.sh

### Description: Install Homebrew package manager for Linux or Mac OS X.
### Author: T.LeBlanc, tlcommodore@gmail.com 03.2017

root_dir=$PWD

function install_homebrew() {
  # Which environment are you in?
  case $1 in
    "Linux x86_64"|"Linux armv6l"|"Linux armv7l")	echo 	"@--> Assuming Linux environment ..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
        # PATH="$HOME/.linuxbrew/bin:$PATH"
        echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile
        # echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >>~/.bash_profile
        # echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >>~/.bash_profile
        source ~/.bash_profile
        ;;
    "Darwin x86_64")	echo	"@--> Assuming Mac OS X environment ..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ;;
  esac

  return
}

function install_apps() {
  /home/vagrant/.linuxbrew/bin/brew install bash-completion git liquidprompt
}


# Main
echo
echo "-------------- Homebrew Install --------------"
echo "@> Installing homebrew..."

install_homebrew $1
install_apps

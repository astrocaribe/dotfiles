#!/usr/bin/env bash
# Filename: zsh-setup.sh

### Description: Installs zsh, and sets as default shell
### This should be done last, as a reboot will be necessary to setup zsh as default
### as well as setting `powerlevel10k` theme.
### Author: T.LeBlanc, tlcommodore@gmail.com 12.2021

root_dir=$PWD

function install_zsh() {
  # Which environment are you in?
  case $1 in
    "Linux armv6l"|"Linux armv7l")	echo 	"@--> Assuming ${GREEN}Linux${NC} environment..."
        install_zsh_arm
        ;;
    "Darwin x86_64")	echo	"@--> Assuming ${GREEN}Mac OS X${NC} environment..."
        install_zsh_macosx
        ;;
  esac

  return
}


function install_zsh_arm () {
  # Install zsh as root
  sudo apt-get install zsh

  # Verify (echo) that zsh was installed
  echo -e ${GREEN}$(zsh --version)${NC}
  echo

  # Set as default shell
  sudo chsh -s /bin/zsh

  # Copy stock .zshrc file
  cp .zshrc ~/

  # Reboot Raspberry Pi
  echo -e ${GREEN}Rebooting pi. Please wait at least 30s before reconnecting.${NC}
  sleep 2
  sudo reboot
}


function install_zsh_macosx () {
  # Install zsh as root
  sudo apt install zsh

  # Verify (echo) that zsh was installed
  echo -e ${GREEN}$(zsh --version)${NC}
  echo

  # Set as default shell
  sudo chsh -s $(which zsh)

  # Copy stock .zshrc file
  cp .zshrc ~/

  # Reboot Raspberry Pi
  echo -e ${GREEN}Rebooting pi. Please wait at least 30s before reconnecting.${NC}
  sleep 2
  sudo reboot
}

function install_oh_my_zsh () {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

# Main
echo
echo "-------------- ${GREEN}Zsh Install${NC} --------------"
echo "@> Installing zsh..."

install_zsh $1
install_oh_my_zsh
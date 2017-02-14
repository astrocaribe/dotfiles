#!/usr/bin/env bash
# Filename: atom-setup.sh

### Description: Installs Atom editor from source (GitHub), installs packages,
### then copies configurations from configs folder.
### Author: T.LeBlanc, tlcommodore@gmail.com 02.2017

root_dir=$PWD

# Install Atom Editor
function install_atom () {
  echo "@--> Downloading/Installing atom ..."

  mkdir $root_dir/temp; cd $root_dir/temp
  git clone https://github.com/atom/atom.git
  cd atom
  script/build --install

  # Create atom and apm symbolic links
  ln -s /Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm /usr/local/bin
  ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin

  # Return to root
  cd $root_dir

  return
}

# Install commonly used packages given a text file with said packages
function install_atom_packages () {
  echo "@--> Downloading/Installing atom packages ..."

  apm install --packages-file $root_dir/atom-packages.txt
  return
}

# Copies configurations for installed packages
function copy_configs () {
  echo "@--> Copying configs ..."
  cp $root_dir/configs/* ~/.atom/

  return
}

# Cleanup
function cleanup () {
  echo "@--> Removing temp folder..."

  rm -rf temp

  return
}

function main () {
  echo
  echo "@> -------------- Atom editor packages --------------"
  echo "@> Setting up Atom editor ..."

  install_atom                # Download latest atom, build, and install
  install_atom_packages       # Install user packages from atom-packages.txt
  copy_configs                # Copy user config files to atom
  trap cleanup EXIT           # Remove temp folder

  echo "@> Done!"

  return
}

# Main function
main "$@"

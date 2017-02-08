#!/usr/bin/env bash
#Filename: nvm-setup.sh

# Installs and sets up NVM (w/ npm)
# https://github.com/creationix/nvm for more information.

# Define nvm directory
# TODO: Change creation directions to ~/ (user root) for real world use!

nvm_dir=./
node_version=v6.9.5

function create_directory() {
  echo "@--> Creating .nvm directories"

  mkdir $nvm_dir/temp
  return
}

function install_nvm() {
  echo "@--> Downloading/Installing nvm.."
  cd $nvm_dir/temp
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

  cd ..

  return
}

function install_node() {
  echo "@--> Installing node $1 ..."
  source ~/.bash_profile
  nvm install $1

  return
}

function cleanup() {
  echo "@--> Cleaning up..."

  rm -rf $nvm_dir/temp

  return
}

# Main
echo
echo "-------------- NVM setup --------------"
echo "@> Installing nmv..."

create_directory              # Create temp directory
install_nvm                   # Download/install nvm
install_node $node_version    # Install node given version
cleanup                       # Cleanup temo directory

#!/usr/bin/env bash
# Filename: atom-setup.sh

# TODO: Include the ability to download and self-install Atom

# Install commonly used packages given a text file with said packages
install_atom_packages () {
  echo "@--> Downloading/Installing atom packages..."

  apm install --packages-file scripts/atom/atom-packages.txt
  return
}

# Main
echo
echo "@> -------------- Atom editor packages --------------"
echo "@> Setting up Atom packages (and soon settings)..."

install_atom_packages

echo "@> Done!"

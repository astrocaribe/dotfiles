#!/usr/bin/env bash
#Filename: atom-setup.sh

echo
echo "-------------- Atom editor packages --------------"

# Install commonly used packages given a text file with said packages
install_atom_packages () {
  echo "  Downloading/Installing atom packages..."

  apm install --packages-file atom-packages.txt
  return
}

# Main
install_atom_packages

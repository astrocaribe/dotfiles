#!/usr/bin/env bash
#Filename: atom-setup.sh

# Install commonly used packages given a text file with said packages
echo "Downloading/Installing atom packages..."

apm install --packages-file ./atom-packages.txt

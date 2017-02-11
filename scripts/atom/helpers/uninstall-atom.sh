#!/usr/bin/env bash
# Filename: uninstall-atom.sh

# Helper script to removing traces of Atom app

rm -rf .atom/
rm -rf /Applications/Atom.app
rm /usr/local/bin/atom
rm /usr/local/bin/apm
rm -rf ~/Library/Preferences/com.github.atom.plist
rm -rf ~/Library/Application\ Support/Atom/
rm -rf ~/Library/Saved\ Application\ State/com.github.atom.savedState/
rm -rf ~/Library/Caches/com.github.atom/
rm -rf ~/Library/Caches/com.github.atom.ShipIt/
rm ~/Library/Preferences/com.github.atom.helper.plist

# dotfiles AI Project

## Auto Install Your Dotfiles!

This repo houses my current project that auto installs most used dotfiles and
configurations that I currently use in my dev environment. The intention of
these scripts is to quickly bootstrap a clean install of a Mac OS X environment
(and soon to be applied to Raspberry Pi).

This is a minimal README, mostly a reminder document to help me set up my
system using the files from this repo. It is my intention to update this repo
whenever I have any Earth-shaking changes that I want to remember!  

There is also a document [here](NewEnvSetup.md) that details current strategy
and packages that I use for setting up a new environment.
**Note: Still a work in progress!**

## Scripts
A current list of scripts:  
	* vim - Download/install codeschool theme, setup syntax, line numbers
	* atom - Install list of atom packages
	* .alias - Install aliases
	* git - Configure git and add aliases

## Samples
A sample of the dotfiles produced by these scripts, if you don't want to
bootstrap. Simply copy the dotfiles from this directory, modify to your heart's
content, then paste into the appropriate directory; most likely `~/`.

## Bootstrapping
Take a walk on the wild side, and bootstrap your enviroment with one command!
Modify the scripts to your liking (*pssstt*, check them out in the `scripts`
directory!), then auto install it all with `. install-dev-env.sh`. **Note:
Make sure the installer is executable:**

`$> chmod a+x install-dev-env.sh`


## Dotfiles
Below are brief descriptions of what each dot file does:  

### .alias
This script is intended to house user-defined aliases, and nothing else!
This scripts can be rerun directly, or via the 'reload' alias defined therein.
For example, you can add new aliases and activate them by typing the following:

`$> reload`

No need to start a new terminal session!

### .bashrc
This script is intended to house operations that you'd typically like to start
only once, at the start of a new terminal. You can also add additional tasks
here that are supportive of a *`reload`* of sorts; re-sourcing other dot files
to add additional behaviour/characteristics without shutting down/restarting
your current terminal session.  

One example of operations that can/should be done in here are alterations to
your prompt via $PS1 variable. Change the prompt at will, and reload by
executing:

`$> reload`

Boom!!!

### .profile/.bash_profile
This profile is intended to launch only when a new terminal is open. Currently,
it's only purpose is to launch the .profile script. This script is intended to
run only once, at the start of a new terminal session. You would not typically
want to run this more than once per session; for that functionality, add to the
.bashrc file instead!

Some programs installed via Homebrew (and possibly others) install to .profile
instead of .bash_profile. However, (if I remember right), I new terminal
session will launch a .bash_profile script first. In this case, this script
will launch the .profile script. This helps me avoid having to cut/paste code
placed in .profile to .bash_profile. For example, executing:

`export PATH=/usr/local/bin:$PATH`

will cause `/usr/local/bin` to be added to the $PATH variable every time it is
executed. This particular example will probably not break anything, but will
make for an unusually long and ugly $PATH environmental variable.

This script houses everything you would need to do to set up a terminal
environment; the contents of this script are not intended to be run more than
once in a terminal session.

## TODO:
* Modify install-dev-env.sh to custom install based on detected OS (e.g., don't
install atom + packages on a Raspbian OS)
* Dotfile setup scripts:
	- ~~.bashrc~~ No need. Checking for presence, and override aliases.
	- ~~.profile/.bash_profile~~
	- .liquidpromptrc
	- .bash_functions
* Apps setup scripts:
	- ~~download/install curl if not present~~
	- ~~download/install unzip if not present~~
	- ~~download/install git if not present~~
	- ~~download/install atom editor~~
	- download/install liquidprompt
	- download/install homebrew + packages
	- download/install intelliJ IDEA
	- setup python packages (via pip)
	- ~~setup node + packages (via nvm)~~
	- setup ruby + packages (via rvm or rbenv)
	- setup clojure + packages (lein, cursive)

# AstroCaribe dotFiles Project

This is a minimal README, mostly a reminder document to help me set up my system using the files from this repo. It is my intention to update this repo whenever I have any Earth-shaking changes that I want to remember!  

For reference, the name of the dot file is echoed at the beginning of every file; this is a self-reminder as to what runs when. If you are a user other than myself, please feel free to comment/remove these lines as necessary!  

Below are brief descriptions of what each dot file does:  

### .bashrc
This script is intended to house operations that you'd typically like to start only once, at the start of a new terminal. You can also add additional tasks here that are supportive of an *'refresh'* of sorts; re-sourcing other dot files to add additional behaviour/characteristics without shutting down/restarting your current terminal session.  

One example of operations that can/should be done in here are alterations to your prompt via $PS1 variable. Change the prompt at will, and reload by executing: 

    $> refresh

Boom!!!

### .alias
This script is intended to house user-defined aliases, and nothing else!
This scripts can be rerun directly, or via the 'refresh' alias defined therein. For example, you can add new aliases and activate them by typing the following:

    $> refresh
No need to start a new terminal session!

### .bash_profile
This profile is intended to launch only when a new terminal is open. Currently, it's only purpose is to launch the .profile script.  

Some programs installed via Homebrew (and possibly others) install to .profile instead of .bash_profile. However, (if I remember right), I new terminal session will launch a .bash_profile script first. In this case, this script will launch the .profile script. This helps me avoid having to cut/paste code placed in .profile to .bash_profile.

### .profile
This script is intended to run only once, at the start of a new terminal session. You would not typically want to run this more than once per session; for that functionality, add to the .bashrc file instead!  

This script houses everything you would need to do to set up a terminal environment; the contents of this script are not intended to be run more than once in a terminal session. For example, executing:

    export PATH=/usr/local/bin:$PATH

will cause `/usr/local/bin` to be added to the $PATH variable everytime it is executed. This particular example will probably not break anything, but will make for an unusually long and ugly $PATH environmental variable.

## Future Additions!
In the future, a few more dot files may be included in this repo as needed. I should not go too crazy here, so that I can keep track of the different dot files needed to edit for a particular task. See below for more vague details!  

### .bash_functions
This script will house custom functions that will be needed by the terminal for various functions.




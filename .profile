echo 'Executing .profile!'
# This script is intended to run only once, at the start of a new terminal session.
# You would not typically want to run this more than once per session; for that 
# functionality, add to the .bashrc file instead!

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Set /usr/local/bin ahead of /usr/bin to use Homebrew apps first
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/Cellar/mysql/bin

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Add /usr/local/sbin for RabbitMQ (via Homebrew)
PATH=$PATH:/usr/local/sbin/

# bash-completion (via Homebrew)
# See [here](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)
#   for more info! 
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# liquidprompt (via Homebrew)
#See [here](https://github.com/nojhan/liquidprompt) for more info
if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi
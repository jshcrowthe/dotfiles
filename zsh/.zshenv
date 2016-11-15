# Path to your oh-my-zsh installation.
export ZSH=/Users/jshcrowthe/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="agnoster"

plugins=(git heroku)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.bin:$HOME/.yarn-config/global/node_modules/.bin"

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# Add NVM to PATH
export NVM_DIR="/Users/jshcrowthe/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

# Setting Max Open File Limit
ulimit -n 2048

# My Alias'
alias gitp="git pull --rebase origin"
alias redis-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias node-setup='npm i -g yarn gulpjs/gulp#4.0 yo jspm firebase-tools generator-polymer eslint polylint web-component-tester serve foreman bower polymer-cli'
alias git=hub
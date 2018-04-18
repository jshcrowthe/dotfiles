#!/bin/bash

# Install curl
sudo apt -y install curl

###############################
# Add missing APT packages
###############################

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# OBS (Open Broadcaster Software)
sudo add-apt-repository ppa:obsproject/obs-studio

# Update APT Package List
sudo apt update

# Update Existing Packages
sudo apt -y upgrade 

# Install Packages
sudo apt -y install \
    code \
    ffmpeg \
    git \
    golang-go \
    google-chrome-stable \
    nautilus-dropbox \
    obs-studio \
    terminator \
    vim \
    zsh

# Install Yarn (Separate from the other commands to skip recommends)
sudo apt install --no-install-recommends yarn

# Set Terminator as default terminal
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

# Install oh-my-zsh (do this in a backround shell to prevent the current shell execution from exiting)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" & 
wait

# Get NVM Installed as an oh-my-zsh plugin
git clone https://github.com/lukechilds/zsh-nvm $HOME/.oh-my-zsh/custom/plugins/zsh-nvm

# Install github.com/github/hub
go get github.com/github/hub

# Make dev dirs
mkdir -p $HOME/Repos
mkdir -p $HOME/Sandbox
mkdir -p $HOME/.bin
mkdir -p $HOME/.config/terminator

# Copy down the dotfiles repo
git clone https://github.com/jshcrowthe/dotfiles $HOME/Repos/dotfiles

# Symlink the .zshrc
rm $HOME/.zshrc
ln -s $HOME/Repos/dotfiles/ubuntu/config/.zshrc $HOME/.zshrc

# Symlink the .gitconfig
rm $HOME/.gitconfig
ln -s $HOME/Repos/dotfiles/ubuntu/config/.gitconfig $HOME/.gitconfig

# Symlink the Terminator config
rm $HOME/.config/terminator/config
ln -s $HOME/Repos/dotfiles/ubuntu/config/terminator_config $HOME/.config/terminator/config

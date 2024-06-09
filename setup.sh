#!/usr/bin/env bash

# Gets path to which this script is located
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

# Make sure $HOME/.config exists
[ ! -d $HOME/.config/ ] && mkdir $HOME/.config/

# To get a nerd font run:
[ ! -f JetBrainsMono.zip ] && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
mkdir -p ~/.fonts/JetBrainsMonoNerdFont && unzip JetBrainsMono.zip -d ~/.fonts/JetBrainsMonoNerdFont
rm JetBrainsMono.zip

#Installs starship
curl -sS https://starship.rs/install.sh | sh

# Set the history and shopt bash files
mv history.sh $HOME/.config/
mv shopt.sh $HOME/.config/
mv starship.toml $HOME/.config/
mv .gitconfig $HOME/.config/
cat $SCRIPT_DIR/.bashrc >> ~/.bashrc

source ~/.bashrc

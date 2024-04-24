#!/usr/bin/env bash
set -euo pipefail

# Gets path to which this script is located
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

# To get a nerd font run:
[ ! -f JetBrainsMono.zip ] && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
mkdir -p ~/.fonts/JetBrainsMonoNerdFont && unzip JetBrainsMono.zip -d ~/.fonts/JetBrainsMonoNerdFont
rm JetBrainsMono.zip

#Installs starship
curl -sS https://starship.rs/install.sh | sh

# Set the history and shopt bash files
mv history.sh $HOME/.config/history.sh
mv shopt.sh $HOME/.config/shopt.sh
mv starship.toml $HOME/.config/starship.toml
cat $SCRIPT_DIR/.bashrc >> ~/.bashrc

source ~/.bashrc

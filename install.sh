#!/bin/bash

# setup git
git config --global user.name "Chris Cornelison"
git config --global user.email "chris.cornelison@pioneer.com"

# upgrade to Vim 8.0
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt -y update
sudo apt -y install vim

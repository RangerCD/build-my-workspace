#!/bin/bash

source default.conf
source workspace.conf

if [[ ${TARGET_SHELL} != "zsh" ]]; then
    echo "Target shell is not zsh, skip"
    exit
fi

$SUDO yum -y install zsh

chsh -s `which zsh`

# oh-my-zsh
RUNZSH=no CHSH=no bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

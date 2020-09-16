#!/bin/bash

source default.conf
source workspace.conf

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Install rbenv extension
(cd ~/.rbenv && src/configure && make -C src)

# Add to PATH
case ${TARGET_SHELL} in
    bash)
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
        echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
        source ~/.bash_profile
        ;;
    zsh)
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
        echo 'eval "$(rbenv init -)"' >> ~/.zshrc
        source ~/.zshrc
       ;;
esac

# Install ruby-build
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install dependencies
$SUDO yum install -y \
    openssl-devel \
    readline-devel

# Compile install target ruby
rbenv install ${TARGET_RUBY_VERSION}

# Config default golang environment
rbenv global ${TARGET_RUBY_VERSION}

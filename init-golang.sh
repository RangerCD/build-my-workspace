#!/bin/bash

source default.conf
source workspace.conf

# Install bison which is required by gvm
if ! yum list installed bison; then
    $SUDO yum -y install bison
fi

# Install gvm
$TARGET_SHELL < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm

# Install golang bootstrap toolchain
gvm install go1.4 -B

# Compile install target golang
gvm use go1.4
gvm install go${TARGET_GOLANG_VERSION}

# Config default golang environment
gvm use go${TARGET_GOLANG_VERSION} --default

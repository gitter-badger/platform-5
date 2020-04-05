#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install cask
brew install gnu-sed
if ! grep -q 'PATH="/usr/local/opt/gnu-sed' ~/.bash_profile; then
echo 'export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"' >> ~/.bash_profile
fi


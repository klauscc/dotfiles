#!usr/bin/env sh

## install brew
if ! type "brew" > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

## install nodejs
if ! type "node" > /dev/null; then
    brew install node
fi

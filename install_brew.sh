#!/usr/bin/env sh

# Package manager on macOS
## install brew
if ! type "brew" > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ "$(uname -m)" == "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

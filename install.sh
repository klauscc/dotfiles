#!/usr/bin/env sh


## install brew
if ! type "brew" > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

## install nodejs
if ! type "node" > /dev/null; then
    brew install node
fi

## install go
if ! type "go" > /dev/null; then
    brew install golang
fi

## install stow
if ! type "stow" > /dev/null; then
    brew install stow
fi

##  fuzzy finders
brew install ripgrep
brew install rga
brew install pandoc poppler tesseract ffmpeg
## formatter and linter
brew install efm-langserver
## markdown previewer
brew install glow

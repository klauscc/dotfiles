#!/usr/bin/env sh

# install brew
. ./install_brew.sh

# Languages
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

# Install Packages via brew
## install neovim
brew install neovim
##  fuzzy finders
brew install ripgrep
brew install rga
brew install fd
brew install pandoc poppler tesseract ffmpeg
## formatter and linter
brew install efm-langserver
brew install lua-language-server

## markdown previewer
brew install glow

# Install packages via npm

## language servers
npm i -g pyright # python

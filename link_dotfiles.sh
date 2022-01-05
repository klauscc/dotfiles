#!/usr/bin/env sh

brew install stow
stow -d ./dotfiles -t $HOME nvim
stow -d ./dotfiles -t $HOME tmux
stow -d ./dotfiles -t $HOME git

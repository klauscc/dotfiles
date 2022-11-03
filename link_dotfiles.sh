#!/usr/bin/env sh

stow -d ./dotfiles -t $HOME bashrc
stow -d ./dotfiles -t $HOME nvim
stow -d ./dotfiles -t $HOME tmux
stow -d ./dotfiles -t $HOME git
stow -d ./dotfiles -t $HOME black

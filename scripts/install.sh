#!/usr/bin/env bash
set -e

if [ ! -d "$HOME/workspace" ]
then
        mkdir -p "$HOME/workspace"
fi

if [ ! -d "$HOME/workspace/dotfiles" ]
then
  read -p  "Enter your full name for git: " name </dev/tty
  read -p  "Enter your email for git: " email </dev/tty

  curl -sL -o /tmp/master.tar.gz https://github.com/miguel250/dotfiles/archive/master.tar.gz
  tar -xzf /tmp/master.tar.gz -C ~/workspace

  rm -rf /tmp/master.tar.gz

  mv ~/workspace/dotfiles-master ~/workspace/dotfiles
  ~/workspace/dotfiles/scripts/bootstrap --name "$name" --email "$email"

  source  ~/workspace/dotfiles/brew/path.zsh
  git clone https://github.com/miguel250/dotfiles.git /tmp/dotfiles
  mv /tmp/dotfiles/.git ~/workspace/dotfiles
  rm -rf /tmp/dotfiles
else
  source  ~/workspace/dotfiles/brew/path.zsh
  git -C ~/workspace/dotfiles pull
  ~/workspace/dotfiles/scripts/bootstrap -c
fi

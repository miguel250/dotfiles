#!/usr/bin/env bash
set -ex

export WORKSPACE_PATH="$WORKSPACE"

if [ -z ${WORKSPACE+x} ]
then
  export WORKSPACE_PATH="$HOME/workspace"
fi

if [ ! -d "$WORKSPACE_PATH" ]
then
  mkdir -p "$WORKSPACE_PATH"
fi

DOTFILES_PATH="$WORKSPACE_PATH/dotfiles"


function get_git_directory {
  source  $DOTFILES_PATH/brew/path.zsh
  git clone https://github.com/miguel250/dotfiles.git /tmp/dotfiles
  mv /tmp/dotfiles/.git $DOTFILES_PATH
  rm -rf /tmp/dotfiles
}

if [ ! -d "$DOTFILES_PATH" ]
then
  read -p  "Enter your full name for git: " name </dev/tty
  read -p  "Enter your email for git: " email </dev/tty

  curl -sL -o /tmp/master.tar.gz https://github.com/miguel250/dotfiles/archive/master.tar.gz
  tar -xzf /tmp/master.tar.gz -C /tmp

  rm -rf /tmp/master.tar.gz

  mv /tmp/dotfiles-master "$DOTFILES_PATH"
  python3 $DOTFILES_PATH/scripts/bootstrap --name "$name" --email "$email"
  get_git_directory
else
  if [ ! -d "$DOTFILES_PATH/.git" ]
  then
    get_git_directory
  fi

  source  $DOTFILES_PATH/brew/path.zsh
  git -C $DOTFILES_PATH pull --rebase
  python3 $DOTFILES_PATH/scripts/bootstrap -c
  echo "Don't forget to run reload! and update tmux"
fi

if [ ! -f "$DOTFILES_PATH/.git/hooks/post-merge" ]
then
  ln -s $DOTFILES_PATH/scripts/post-merge $DOTFILES_PATH/.git/hooks
fi

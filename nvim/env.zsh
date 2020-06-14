if [ "$DOTFILES_NO_AUTO_UPDATE"  = true ]
then
  git -C $WORKSPACE/vimrc pull --rebase > /dev/null
fi

if [ "$DOTFILES_NO_AUTO_UPDATE"  = true ]
then
  git -C $WORKSPACE/vimrc pull  > /dev/null
fi

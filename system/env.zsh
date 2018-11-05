export EDITOR='nvim'
export LANG=en_US.UTF-8
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))

if [ -z ${DOTFILES_NO_AUTO_UPDATE+x} ]
then
  export DOTFILES_NO_AUTO_UPDATE=true
fi

if [ "$DOTFILES_NO_AUTO_UPDATE"  = true ]
then
  git -C $DOTFILEDIR pull  > /dev/null
fi

# set default umask
umask 022

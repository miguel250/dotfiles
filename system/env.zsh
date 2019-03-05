export EDITOR='nvim'
export LANG=en_US.UTF-8

PYTHON="python3"
if which python > /dev/null 2>&1
then
  PYTHON="python"
fi

realpath="$PYTHON -c 'import os, sys; print os.readlink(sys.argv[1])'"
export JAVA_HOME=$(dirname $(dirname $(realpath $(which javac))))

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

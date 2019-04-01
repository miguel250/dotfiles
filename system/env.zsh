export EDITOR='nvim'
export LANG=en_US.UTF-8

PYTHON="python3"
if which python > /dev/null 2>&1
then
  PYTHON="python"
fi

realpath="$PYTHON -c 'import os, sys; print os.readlink(sys.argv[1])'"
export JAVA_HOME=$(dirname $(dirname $(realpath $(which javac))))

plataform="$(uname -m)"
name="$(echo "$(uname)" | awk '{print tolower($0)}')"

if [[ "$name" == "darwin" ]]
then
  export JAVA_HOME=$(/usr/libexec/java_home -v8) &> /dev/null
fi

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

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH


NVM_PATH="$(brew --prefix nvm)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_PATH/nvm.sh" ] && \. "$NVM_PATH/nvm.sh"
[ -s "$NVM_PATH/etc/bash_completion.d/nvm" ] && \. "$NVM_PATH/etc/bash_completion.d/nvm"

if which nvm  > /dev/null 2>&1
then
  if [[ $(nvm ls | grep "v$NODEJS_VERSION") == "" ]]; then
    rm -rf $NVM_DIR
    mkdir -p $NVM_DIR
    ln -s $DOTFILEDIR/nodejs/default-packages $NVM_DIR/default-packages
    nvm install $NODEJS_VERSION
    nvm use $NODEJS_VERSION
    nvm alias default $NODEJS_VERSION
  fi
fi


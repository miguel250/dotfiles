if which gvm  > /dev/null 2>&1
then
  plataform="$(uname -m)"
  name="$(echo "$(uname)" | awk '{print tolower($0)}')"
  arch="UNKNOWN"

  if [ $plataform = "x86_64" ]
  then
    arch="amd64"
  fi

  go_directory="$HOME/.gvm/versions/go$GO_VERSION.$name.$arch"

  if [[ ! -d "$go_directory" ]]
  then
    echo "We might be installing go. This might take a while."
  fi
  eval "$(gvm $GO_VERSION)"
fi

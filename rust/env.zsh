if which rustup > /dev/null 2>&1
then
  plataform="$(uname -m)"
  name="$(echo "$(uname)" | awk '{print tolower($0)}')"
  arch="unknown"
  license_type="-gnu"


  if [[ "$name" == "darwin" ]]
  then
    arch="apple"
    license_type=""
  fi

  name="$RUST_VERSION-$plataform-$arch-$name$license_type"

  if ! grep -q "$name" $HOME/.rustup/settings.toml
  then
    echo "Installing rust $RUST_VERSION"
    rustup default $RUST_VERSION
  fi
fi

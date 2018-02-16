
if test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
  HOMEBREW_PATH="$HOME/.linuxbrew"
  [[ ":$PATH:" != *":$HOMEBREW_PATH/bin:$HOMEBREW_PATH/sbin:"* ]] && \
    export PATH="$HOMEBREW_PATH/bin:$HOMEBREW_PATH/sbin:$PATH"

  HOMEBREW_PATH="/home/linuxbrew/.linuxbrew"
  [[ ":$PATH:" != *":$HOMEBREW_PATH/bin:$HOMEBREW_PATH/sbin:"* ]] && \
    export PATH="$HOMEBREW_PATH/bin:$HOMEBREW_PATH/sbin:$PATH"
fi

if which brew > /dev/null 2>&1
then
  [[ ":$PATH:" != *":$(brew --prefix)/bin:$(brew --prefix)/sbin:"* ]] && \
    export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH" && \
    fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

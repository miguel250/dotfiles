# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# Make hub alias for git
if $(hub &> /dev/null)
then
    eval "$(hub alias -s)"
fi

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

if type rg > /dev/null 2>&1; then
 alias grep='rg -uu'
fi

if type gawk > /dev/null 2>&1; then
    alias awk='gawk'
fi

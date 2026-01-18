# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  test -f  `brew --prefix`/etc/grc.zsh && source `brew --prefix`/etc/grc.zsh
fi

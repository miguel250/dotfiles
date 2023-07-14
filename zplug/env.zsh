source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', \
  at:31a6264, \
  as:command, use:"wd.sh", \
  hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

zplug "zsh-users/zsh-autosuggestions", \
  at:9b02729

export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

zplug "plugins/extract", \
  at:fe4b565, \
  from:oh-my-zsh

zplug "mafredri/zsh-async", \
  at:ee1d11b

zplug "sindresorhus/pure", \
  at:87e6f5d, \
  use:pure.zsh, \
  as:theme

if ! zplug check; then
  zplug install
fi

zplug load

zstyle ':prompt:pure:prompt:success' color 003

fpath=($ZPLUG_REPOS/mfaerevaag/wd  $fpath)
rm -f $HOME/.zcompdump; compinit

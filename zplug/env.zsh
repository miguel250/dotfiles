source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', \
  at:8b12c38, \
  as:command, use:"wd.sh", \
  hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

zplug "tarruda/zsh-autosuggestions", \
  at:ae315de

export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

zplug "plugins/extract", \
  at: 78b07e9, \
  from:oh-my-zsh

zplug "mafredri/zsh-async", \
  at: bbbc92b

zplug "sindresorhus/pure", \
  at: 8ec575c, \
  use:pure.zsh, \
  as:theme

if ! zplug check; then
  zplug install
fi

zplug load

zstyle ':prompt:pure:prompt:success' color 003

fpath=($ZPLUG_REPOS/mfaerevaag/wd  $fpath)
rm -f $HOME/.zcompdump; compinit



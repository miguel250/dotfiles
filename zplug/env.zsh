source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', \
  at:5db678c, \
  as:command, use:"wd.sh", \
  hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

zplug "zsh-users/zsh-autosuggestions", \
  at:a411ef3

export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

zplug "plugins/extract", \
  at: 6fbad5b, \
  from:oh-my-zsh

zplug "mafredri/zsh-async", \
  at: a61239d

zplug "sindresorhus/pure", \
  at: 5b458ba, \
  use:pure.zsh, \
  as:theme

if ! zplug check; then
  zplug install
fi

zplug load

zstyle ':prompt:pure:prompt:success' color 003

fpath=($ZPLUG_REPOS/mfaerevaag/wd  $fpath)
rm -f $HOME/.zcompdump; compinit

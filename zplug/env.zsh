source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', \
  at:a5d5ced, \
  as:command, use:"wd.sh", \
  hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"


zplug "tarruda/zsh-autosuggestions", \
  at:fa5d9c0

export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

zplug "plugins/extract", \
  at:ab9d92f, \
  from:oh-my-zsh

if ! zplug check; then
  zplug install
fi

zplug load

source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', \
  at:303e68f, \
  as:command, use:"wd.sh", \
  hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

zplug "tarruda/zsh-autosuggestions", \
  at:43f3bc4010b2c697d2252fdd8b36a577ea125881

export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

zplug "plugins/extract", \
  at:586ca16, \
  from:oh-my-zsh

if ! zplug check; then
  zplug install
fi

zplug load

fpath=($ZPLUG_REPOS/mfaerevaag/wd  $fpath)
rm -f $HOME/.zcompdump; compinit

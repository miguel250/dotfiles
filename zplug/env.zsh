source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', \
  at:3cbc583, \
  as:command, use:"wd.sh", \
  hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

zplug "tarruda/zsh-autosuggestions", \
  at:e9d8231ba7dfbf7afb3f2a57ae00b803b4ae9f83

export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

zplug "plugins/extract", \
  at:ab9d92f, \
  from:oh-my-zsh

if ! zplug check; then
  zplug install
fi

zplug load

fpath=($ZPLUG_REPOS/mfaerevaag/wd  $fpath)
rm -f $HOME/.zcompdump; compinit

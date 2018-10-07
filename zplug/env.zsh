source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', \
  at:a5d5ced, \
  as:command, use:"wd.sh", \
  hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"


zplug "tarruda/zsh-autosuggestions", \
  at:ebaf409

zplug "plugins/extract", \
  at:ab9d92f, \
  from:oh-my-zsh

if ! zplug check; then
  zplug install
fi

zplug load
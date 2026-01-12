export CLICOLOR=true
export LSCOLORS="exfxcxdxbxegedabagacad"

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

function chpwd() {
    ls -a
}

autoload -Uz add-zsh-hook

# make sure we update hooks on source
add-zsh-hook -D precmd dotfile_title_precmd
add-zsh-hook -D preexec dotfile_title_preexec

add-zsh-hook precmd dotfile_title_precmd
add-zsh-hook preexec dotfile_title_preexec

fpath=($DOTFILEDIR/functions $fpath)

autoload -U $DOTFILEDIR/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
HISTIGNORE="ls:ll:la:lla:pwd:exit:clear:z"

setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt HIST_VERIFY
setopt SHARE_HISTORY INC_APPEND_HISTORY HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INTERACTIVE_COMMENTS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

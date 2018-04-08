if which fzf > /dev/null 2>&1
then
  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source " $(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  # ------------
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi

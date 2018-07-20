if [[ ! -f /tmp/tmux-session-env &&  -n "$TMUX" ]]; then
  tmux show-env -s &> /tmp/tmux-session-env
fi


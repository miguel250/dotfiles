autoload colors && colors
bell=`tput bel` 
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_dirty() {
  st=$(git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "[%{$fg_bold[cyan]%}$(git_prompt_info)%{$reset_color%}]"
    else
      echo "[%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}]"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

directory_name(){
  echo "%{%b%F{green}%~%{%B%F{green}%}"
}

export PROMPT=$'$(directory_name) $(git_dirty)› '


precmd() {
  echo -n "\033]1;$bell\033]2;$PWD > - $USERNAME@$HOST $bell" 

}
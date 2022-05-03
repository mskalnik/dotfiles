#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ..="cd .."
alias awesomerc="vim ~/.config/awesome/rc.lua"
alias bashrc="vim ~/.bashrc"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ga="git add"
alias gst="git status"
alias gd="git diff"
alias gc="git commit"
alias gco="git checkout"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias grep='grep --color=auto'
alias la="ls -lisa --color=auto -a"
alias ll="ls -lisa --color=auto"
alias userlist="cut -d: -f1 /etc/passwd"
alias code="flatpak run com.visualstudio.code"
alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Jump to dir
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

PATH="$HOME/bin:$HOME/.local/bin:$PATH"

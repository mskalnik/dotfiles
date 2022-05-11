#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ..="cd .."
alias bashrc="nvim ~/.bashrc"
alias bt="blueman-applet"
alias code="flatpak run com.visualstudio.code"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
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
alias qtilerc="nvim ~/.config/qtile/"
alias userlist="cut -d: -f1 /etc/passwd"

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
# . "$HOME/.cargo/env"

# Git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

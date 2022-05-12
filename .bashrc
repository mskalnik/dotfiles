#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# Jump to directory
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

# Paths
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Aliases
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias bashrc="nvim ~/.bashrc"
alias bt="blueman-applet"
alias code="flatpak run com.visualstudio.code"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ga="git add"
alias gst="git status"
alias gd="git diff"
alias gc="git commit"
alias gco="git checkout"
alias gc!="git commit -v --amend"
alias glog="git log --oneline --decorate --graph"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias grep="grep --color=auto"
alias la="ls -lisa --color=auto -a"
alias ll="ls -lisa --color=auto"
alias lt="ls --human-readable --size -1 -S --classify"
alias mkdir="mkdir -pv"
alias most="du -hsx * | sort -rh | head -10"
alias sha="shasum -a 256"
alias qtilerc="nvim ~/.config/qtile/"
alias userlist="cut -d: -f1 /etc/passwd"
alias update="sudo pacman -Syu -y && flatpak update -y"

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

# Bash prompt - https://wiki.archlinux.org/title/Bash/Prompt_customization
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[31m\]\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

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
alias gb="git branch"
alias gbD="git branch -D"
alias gbd="git branch -d"
alias gbl="git blame -b -w"
alias gc!="git commit -v --amend"
alias gc="git commit"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gd="git diff"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gl="git pull"
alias glog="git log --oneline --decorate --graph"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpr="git pull --rebase"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grep="grep --color=auto"
alias grh="git reset"
alias grhh="git reset --hard"
alias gst="git status"
alias gstaa="git stash apply"
alias gstall="git stash --all"
alias la="ls -lisa --color=auto -a"
alias ll="ls -lisa --color=auto"
alias lt="ls --human-readable --size -1 -S --classify"
alias mkdir="mkdir -pv"
alias most="du -hsx * | sort -rh | head -10"
alias qtilerc="nvim ~/.config/qtile/"
alias sha="shasum -a 256"
alias update="sudo pacman -Syu -y && flatpak update -y"
alias userlist="cut -d: -f1 /etc/passwd"
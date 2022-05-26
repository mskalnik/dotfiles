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
COLOR_OFF="\[\033[0m\]"
# Regular Colors
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
# Bold
BOLD_BLACK="\[\033[1;30m\]"
BOLD_RED="\[\033[1;31m\]"
BOLD_GREEN="\[\033[1;32m\]"
BOLD_YELLOW="\[\033[1;33m\]"
BOLD_BLUE="\[\033[1;34m\]"
BOLD_PURPLE="\[\033[1;35m\]"
BOLD_CYAN="\[\033[1;36m\]"
BOLD_WHITE="\[\033[1;37m\]"
# Underline
UNDERLINE_BLACK="\[\033[4;30m\]"
UNDERLINE_RED="\[\033[4;31m\]"
UNDERLINE_GREEN="\[\033[4;32m\]"
UNDERLINE_YELLOW="\[\033[4;33m\]"
UNDERLINE_BLUE="\[\033[4;34m\]"
UNDERLINE_PURPLE="\[\033[4;35m\]"
UNDERLINE_CYAN="\[\033[4;36m\]"
UNDERLINE_WHITE="\[\033[4;37m\]"
# Background
BACKGROUND_BLACK="\[\033[40m\]"
BACKGROUND_RED="\[\033[41m\]"
BACKGROUND_GREEN="\[\033[42m\]"
BACKGROUND_YELLOW="\[\033[43m\]"
BACKGROUND_BLUE="\[\033[44m\]"
BACKGROUND_PURPLE="\[\033[45m\]"
BACKGROUND_CYAN="\[\033[46m\]"
BACKGROUND_WHITE="\[\033[47m\]"
# High Intensty
INTENSITY_BLACK="\[\033[0;90m\]"
INTENSITY_RED="\[\033[0;91m\]"
INTENSITY_GREEN="\[\033[0;92m\]"
INTENSITY_YELLOW="\[\033[0;93m\]"
INTENSITY_BLUE="\[\033[0;94m\]"
INTENSITY_PURPLE="\[\033[0;95m\]"
INTENSITY_CYAN="\[\033[0;96m\]"
INTENSITY_WHITE="\[\033[0;97m\]"
# Bold High Intensty
BOLD_INTENSITY_BLACK="\[\033[1;90m\]"
BOLD_INTENSITY_RED="\[\033[1;91m\]"
BOLD_INTENSITY_GREEN="\[\033[1;92m\]"
BOLD_INTENSITY_YELLOW="\[\033[1;93m\]"
BOLD_INTENSITY_BLUE="\[\033[1;94m\]"
BOLD_INTENSITY_PURPLE="\[\033[1;95m\]"
BOLD_INTENSITY_CYAN="\[\033[1;96m\]"
BOLD_INTENSITY_WHITE="\[\033[1;97m\]"
# High Intensty backgrounds
BACKGROUND_INTENSITY_BLACK="\[\033[0;100m\]"
BACKGROUND_INTENSITY_RED="\[\033[0;101m\]"
BACKGROUND_INTENSITY_GREEN="\[\033[0;102m\]"
BACKGROUND_INTENSITY_YELLOW="\[\033[0;103m\]"
BACKGROUND_INTENSITY_BLUE="\[\033[0;104m\]"
BACKGROUND_INTENSITY_PURPLE="\[\033[10;95m\]"
BACKGROUND_INTENSITY_CYAN="\[\033[0;106m\]"
BACKGROUND_INTENSITY_WHITE="\[\033[0;107m\]"
# PS1 variables
HOSTNAME="\h"
USERNAME="\u"
TIME_12H="\T"
TIME_12A="\@"
PATH_SHORT="\w"
PATH_FULL="\W"
NEW_LINE="\n"
JOBS="\j"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
export PS1="${BOLD_YELLOW}${USERNAME}@${HOSTNAME} ${CYAN}${PATH_FULL}${GREEN}\$(parse_git_branch)${COLOR_OFF}${NEW_LINE}$ "

# Aliases
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias bashrc="emacs ~/.bashrc"
alias bt="blueman-applet"
alias code="flatpak run com.visualstudio.code"
alias doom="~/.emacs.d/bin/doom"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias e="emacs"
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
alias qtilerc="emacs ~/.config/qtile/"
alias sha="shasum -a 256"
alias test="Xephyr -br -ac -noreset -screen 1280x720 :1 & DISPLAY=:1 /usr/bin/qtile start"
alias update="sudo pacman -Syu -y && flatpak update -y"
alias userlist="cut -d: -f1 /etc/passwd"

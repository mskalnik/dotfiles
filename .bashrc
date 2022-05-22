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
COLOR_OFF="\[\033[0m\]"       # Text Reset
# Regular Colors
BLACK="\[\033[0;30m\]"        # BLACK
RED="\[\033[0;31m\]"          # RED
GREEN="\[\033[0;32m\]"        # GREEN
YELLOW="\[\033[0;33m\]"       # YELLOW
BLUE="\[\033[0;34m\]"         # BLUE
PURPLE="\[\033[0;35m\]"       # PURPLE
CYAN="\[\033[0;36m\]"         # CYAN
WHITE="\[\033[0;37m\]"        # WHITE
# Bold
BBLACK="\[\033[1;30m\]"       # BLACK
BRED="\[\033[1;31m\]"         # RED
BGREEN="\[\033[1;32m\]"       # GREEN
BYELLOW="\[\033[1;33m\]"      # YELLOW
BBLUE="\[\033[1;34m\]"        # BLUE
BPURPLE="\[\033[1;35m\]"      # PURPLE
BCYAN="\[\033[1;36m\]"        # CYAN
BWHITE="\[\033[1;37m\]"       # WHITE
# Underline
UBLACK="\[\033[4;30m\]"       # BLACK
URED="\[\033[4;31m\]"         # RED
UGREEN="\[\033[4;32m\]"       # GREEN
UYELLOW="\[\033[4;33m\]"      # YELLOW
UBLUE="\[\033[4;34m\]"        # BLUE
UPURPLE="\[\033[4;35m\]"      # PURPLE
UCYAN="\[\033[4;36m\]"        # CYAN
UWHITE="\[\033[4;37m\]"       # WHITE
# Background
On_BLACK="\[\033[40m\]"       # BLACK
On_RED="\[\033[41m\]"         # RED
On_GREEN="\[\033[42m\]"       # GREEN
On_YELLOW="\[\033[43m\]"      # YELLOW
On_BLUE="\[\033[44m\]"        # BLUE
On_PURPLE="\[\033[45m\]"      # PURPLE
On_CYAN="\[\033[46m\]"        # CYAN
On_WHITE="\[\033[47m\]"       # WHITE
# High Intensty
IBLACK="\[\033[0;90m\]"       # BLACK
IRED="\[\033[0;91m\]"         # RED
IGREEN="\[\033[0;92m\]"       # GREEN
IYELLOW="\[\033[0;93m\]"      # YELLOW
IBLUE="\[\033[0;94m\]"        # BLUE
IPURPLE="\[\033[0;95m\]"      # PURPLE
ICYAN="\[\033[0;96m\]"        # CYAN
IWHITE="\[\033[0;97m\]"       # WHITE
# Bold High Intensty
BIBLACK="\[\033[1;90m\]"      # BLACK
BIRED="\[\033[1;91m\]"        # RED
BIGREEN="\[\033[1;92m\]"      # GREEN
BIYELLOW="\[\033[1;93m\]"     # YELLOW
BIBLUE="\[\033[1;94m\]"       # BLUE
BIPURPLE="\[\033[1;95m\]"     # PURPLE
BICYAN="\[\033[1;96m\]"       # CYAN
BIWHITE="\[\033[1;97m\]"      # WHITE
# High Intensty backgrounds
On_IBLACK="\[\033[0;100m\]"   # BLACK
On_IRED="\[\033[0;101m\]"     # RED
On_IGREEN="\[\033[0;102m\]"   # GREEN
On_IYELLOW="\[\033[0;103m\]"  # YELLOW
On_IBLUE="\[\033[0;104m\]"    # BLUE
On_IPURPLE="\[\033[10;95m\]"  # PURPLE
On_ICYAN="\[\033[0;106m\]"    # CYAN
On_IWHITE="\[\033[0;107m\]"   # WHITE
# PS1 variables
Hostname="\h"
Username="\u"
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
export PS1="${BYELLOW}${Username}@${Hostname} ${CYAN}${PathFull}${GREEN}\$(parse_git_branch)${COLOR_OFF}${NewLine}$ "

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
alias e="emacs&"
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
alias update="sudo pacman -Syu -y && flatpak update -y"
alias userlist="cut -d: -f1 /etc/passwd"

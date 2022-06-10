# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## Custom config
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
COMMAND_NUMBER="\#"
HISTORY_NUMBER="\!"
HOSTNAME="\h"
JOBS_NUMBER="\j"
NEW_LINE="\n"
PATH_FULL="\w"
PATH_SHORT="\W"
SHELL_NAME="\s"
SHELL_PATCH_VERSION="\V"
SHELL_VERSION="\v"
TIME_12A="\@"
TIME_12H="\T"
USERNAME="\u"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
export PS1="${BOLD_YELLOW}${USERNAME}@${HOSTNAME} ${CYAN}${PATH_FULL}${GREEN}\$(parse_git_branch)${COLOR_OFF}${NEW_LINE}$ "

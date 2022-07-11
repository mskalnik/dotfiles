# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status is-interactive
#   ...
# end

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias bashrc="code ~/.bashrc"
alias c="code"
alias cdp="cd ~/prt"
alias chgrp="chgrp --preserve-root"
alias chmod="chmod --preserve-root"
alias chown="chown --preserve-root"
alias cp="cp -i"
alias doom="~/.emacs.d/bin/doom"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias e="emacs"
alias ga="git add"
alias gb="git branch"
alias gbD="git branch -D"
alias gbd="git branch -d"
alias gbl="git blame -b -w"
alias gc="git commit -v --amend"
alias gc="git commit"
alias gcb="git checkout -b"
alias gcm="git commit -m"
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
alias i="intellij-idea-community"
alias la="ls -lisa --color=auto -a"
alias ll="ls -lisa --color=auto"
alias ln="ln -i"
alias lt="ls --human-readable --size -1 -S --classify"
alias mkdir="mkdir -pv"
alias most="du -hsx * | sort -rh | head -10"
alias mv="mv -i"
alias qtilerc="code ~/.config/qtile/"
alias p="pnpm"
alias pls='sudo $(history -p !!)'
alias rm="rm -I --preserve-root"
alias sha="shasum -a 256"
alias untar="tar -zxvf"
alias update="sudo apt update && sudo apt upgrade && snap refresh && flatpak update"
alias userlist="cut -d: -f1 /etc/passwd"
alias v="vim"

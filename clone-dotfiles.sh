#!/bin/bash

git init --bare $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no

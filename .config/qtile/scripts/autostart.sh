#!/bin/sh

xrandr --output DP-2 --left-of DP-0
bluetoothctl power on
picom &
flatpak run org.flameshot.Flameshot&

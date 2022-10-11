#!/bin/sh

xrandr --output DP-2 --left-of DP-0
bluetoothctl power on
flatpak run org.flameshot.Flameshot&
flatpak run com.github.hluk.copyq&

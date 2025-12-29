#!/bin/bash
dir=~/Pictures/wallpapers/
pics=$(ls $dir)
choice=$(echo -e "$pics" | wofi --show dmenu --prompt "choose a wallpaper:")

if [ -n "$choice" ]; then
  swww img "$dir$choice" --transition-type center
fi

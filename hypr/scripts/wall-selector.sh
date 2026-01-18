#!/bin/bash

if [ "$1" == "aura" ]; then
  echo "hii"
  dir=~/Pictures/wallpapers/.aura/
else
  dir=~/Pictures/wallpapers/
fi

pics=$(ls $dir)
choice=$(echo -e "$pics" | wofi --show dmenu --prompt "choose a wallpaper:")

if [ -n "$choice" ]; then
  swww img "$dir$choice" --transition-type center
fi

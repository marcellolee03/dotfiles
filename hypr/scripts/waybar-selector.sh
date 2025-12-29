#!/bin/bash
resourcesDir=$HOME/.config/waybar_themes/
waybars=$(ls $resourcesDir)
choice=$(echo -e "$waybars" | wofi --show dmenu --prompt "choose a waybar:")

if [ -n "$choice" ]; then
  rm -rf $HOME/.config/waybar
  cp -r "$resourcesDir$choice" $HOME/.config/
  mv ~/.config/$choice/ ~/.config/waybar/

  # Restart waybar
  killall waybar
  sleep 0.1
  waybar &
  disown
fi

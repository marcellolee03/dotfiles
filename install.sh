#!/bin/bash

DOTFILES=$HOME/dotfiles

link_config() {
  local folder=$1
  local target=$HOME/.config/$folder

  rm -rf $target
  ln -sfn $DOTFILES/$folder $target
}

link_config "nvim"
link_config "hypr"
link_config "wofi"
link_config "waybar_themes"

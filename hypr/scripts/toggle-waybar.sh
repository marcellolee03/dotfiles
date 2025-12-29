#!/bin/bash

if pgrep -x waybar; then
  pkill -x waybar
else
  waybar >/dev/null 2>&1 &
fi

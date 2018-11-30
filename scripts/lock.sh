#!/bin/bash

# Take a screenshot to temp location
scrot /tmp/screen.png

wallpaper="/tmp/screen.png"

# Blur screenshot
convert $wallpaper -blur 0x9 $wallpaper # -scale 10% -scale 1000% $wallpaper

# Add screenshot
[[ -f $1 ]] && convert $wallpaper $1 -gravity center -composite -matte $wallpaper

# Mute mic and audio
amixer set Master mute
amixer set Capture nocap

# Disable notifications
pkill -u "$USER" -USR1 dunst

# Lock screen
i3lock -n -i $wallpaper

# Enable notifications
pkill -u "$USER" -USR2 dunst

# Unmute mic and audio
amixer set Master unmute
amixer set Capture cap

# Remove screenshot
rm /tmp/screen.png

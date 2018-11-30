#!/bin/bash

# SIMPLE FFMPEG SCREENCAST

OFFS="+0,0"
SIZE="2560x1440"
DATE="$(date '+%Y-%m-%d %H:%M:%S')"

# Flags
# -s --selection
if [ $1 == "-s" ] || [ $1 == "--selection" ] ; then
    read -r X Y W H < <(slop -f "%x %y %w %h")
    SIZE=$W"x"$H
    OFFS="+"$X","$Y
fi

ffmpeg -video_size $SIZE -f x11grab -framerate 60 -i :0.0+0,0 "$HOME/videos/casts/$DATE.mkv"

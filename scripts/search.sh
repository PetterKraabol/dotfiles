#!/usr/bin/sh

# ROFI => SURF SEARCH

rofi -dmenu -theme entry | \
    xargs -I{} google-chrome-stable https://duckduckgo.com/?q={}

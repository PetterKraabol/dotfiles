#!/usr/bin/sh

# ROFI => SURF SEARCH

rofi -dmenu -theme entry | \
    xargs -I{} google-chrome-beta https://duckduckgo.com/?q={}

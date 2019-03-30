#!/usr/bin/sh

# Rofi => Browser

rofi -dmenu -theme entry | \
    xargs -I{} google-chrome-stable {}

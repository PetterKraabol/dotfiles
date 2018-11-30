#/bin/bash

# emacs
#emacs --daemon

# Keyboard layout
setxkbmap -layout no

# Keybinds
xbindkeys

# 1440p 165 Hz
xrandr --output DP-2 --mode 2560x1440 --rate 165

# Network speed
sudo setcap cap_net_admin=ep /usr/bin/i3status


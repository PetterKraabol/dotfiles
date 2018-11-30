#!/bin/bash

filename='%Y-%m-%d-%T.png'

scrot $filename -e 'mv $f ~/Pictures/screenshots; notify-send -i ~/Pictures/screenshots/$f -c screenshot "Screenshot" "~/Pictures/screenshots/$f";'

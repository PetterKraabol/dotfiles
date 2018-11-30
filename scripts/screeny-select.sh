#!/bin/bash

filename='%Y-%m-%d-%T.png'

scrot $filename -s -e 'mv $f ~/Pictures/screenshots; notify-send -i ~/Pictures/screenshots/$f -c screenshot "Screenshot" "~/Pictures/screenshots/$f";'

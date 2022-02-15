#!/bin/sh
scrot -e 'xclip -selection clipboard -t image/png -i $f' ~/Screenshots/ss-%Y-%m-%d-%T.png

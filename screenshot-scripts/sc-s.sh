#!/bin/sh
scrot -e 'xclip -selection clipboard -t image/png -i $f' -l style=dash,width=1 -s ~/Screenshots/ss-%Y-%m-%d-%T.png

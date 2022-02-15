#!/bin/sh
xautolock -time 5 -locker slock -detectsleep &
xclock -ntails 60 &
emwm

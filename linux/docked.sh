#!/bin/sh
# Check to see if we're docked. If we are, switch monitors.

if (xrandr | grep "DP2-2 connected"); then
   xrandr --output DP2-2 --left-of eDP1 --auto --primary --output eDP1 --auto
elif (xrandr | grep "DP1 connected"); then
   xrandr --output DP1 --left-of eDP1 --auto --primary --output eDP1 --auto
else
   xrandr --output DP1 --off --output DP2-2 --off --output eDP1 --auto
fi
feh --bg-scale ~/Dropbox/Photos/Wallpapers/mountainbike1.jpg

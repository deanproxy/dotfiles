#!/bin/sh
# Check to see if we're docked. If we are, switch monitors.

export DISPLAY=:0
export XAUTHORITY=/home/dean/.Xauthority

 if (xrandr | grep "^DP2-2 connected"); then
   xrandr --output DP2-2 --auto --primary --output eDP1 --off
elif (xrandr | grep "^DP1 connected"); then
   xrandr --output DP1 --auto --primary --output eDP1 --off --output DP2-2 --off
else
   xrandr --output eDP1 --auto --primary --output DP2-2 --off 
fi
feh --bg-scale ~/Dropbox/Photos/Wallpapers/mountainbike1.jpg
# Turn off the fucking bell
/usr/bin/xset -display :0 b off
/usr/bin/xset -display :0 r rate 300 80

# Fix touchpad
touchpad="SynPS/2 Synaptics TouchPad"
id=$(xinput | grep "$touchpad" | awk '{print $6}' | sed s/id=//)
if [ ! -z "$id" ]; then
   xinput --set-prop $id "libinput Click Method Enabled" 0 1
fi

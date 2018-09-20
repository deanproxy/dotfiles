#!/bin/sh
# Check to see if we're docked. If we are, switch monitors.

export DISPLAY=:0
export XAUTHORITY=/home/dean/.Xauthority

sysdir="/sys/class/drm/card0-"
external_monitors=("DP-1")
monitor="eDP-1"
current=$(cat /tmp/monitors)
found=0


for i in $external_monitors; do
   status=$(cat "${sysdir}${i}/status")
   if [ "${status}" == "connected" ]; then
      if [ "$current" != "$i" ]; then
         xrandr --output "${i}" --auto --primary --output "${monitor}" --off
         echo "Turning on $i"
      fi
      echo "$i" > /tmp/monitors
      found=1
      break
   fi
done

if [ $found -eq 0 ] && [ $current != "primary" ]; then
   for i in $external_monitors; do
      xrandr --output "$i" --off
   done
   xrandr --output eDP-1 --auto --primary
   echo "primary" > /tmp/monitors
fi

# if (xrandr | grep "DP2-2 connected"); then
   # echo "xrandr --output DP2-2 --left-of eDP-1 --auto --primary --output eDP1 --auto" > file
   # xrandr --output DP2-2 --left-of eDP-1 --auto --primary --output eDP1 --auto
# elif (xrandr | grep "DP-1 connected"); then
   # echo "xrandr --output DP-1 --auto --primary --output eDP-1 --off" > file
   # xrandr --output DP-1 --auto --primary --output eDP-1 --off
# else
   # echo "xrandr --output eDP-1 --auto --primary --output DP-1 --off --output DP2-2 --off" > file
   # xrandr --output eDP-1 --auto --primary --output DP-1 --off --output DP2-2 --off 
# fi
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

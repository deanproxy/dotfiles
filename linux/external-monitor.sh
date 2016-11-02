#!/bin/sh
export DISPLAY=:1
export XAUTHORITY=/run/user/1000/gdm/Xauthority

logger "ACPI event: $*"


if [ "$1" = "dock" ]; then
    logger "ACPI event: Turning on DP2-2. This will take 10 seconds or so..."
    while (xrandr | grep "DP2-2 disconnected"); do
        sleep 1
    done
    sleep 1
    xrandr --verbose --output eDP1 --off --output DP2-2 --mode 2560x1440 --primary 2>&1 | logger
    /home/dean/Scripts/background.sh
else
    logger "ACPI event: Turning off DP2-2"
    xrandr  --verbose --output DP2-2 --off --output eDP1 --mode 1920x1080 --primary 2>&1 | logger
fi

#!/bin/sh
# Check to see if we're docked. If we are, switch monitors.

if (xrandr | grep "DP2-2 connected"); then
    /etc/acpi/external-monitor.sh dock
fi

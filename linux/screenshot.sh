#!/bin/sh
# Install scrot, imgur and xsel:
#  - sudo apt install xsel scrot
#  - sudo npm i -g imgur

DISPLAY=:1

if [ "$1" = "select" ]; then
   scrot -s -e 'imgur $f | xsel -b; rm -f $f'
else
   scrot -e 'imgur $f | xsel -b; rm -f $f'
fi
i3-nagbar -f "pango:Ubuntu Medium 11" -t warning -m "Screenshot saved to clipboard."

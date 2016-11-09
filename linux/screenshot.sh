#!/bin/sh
# Install imgur and xsel:
#  - sudo apt install xsel
#  - sudo npm i -g imgur

if [ "$1" = "select" ]; then
   scrot -s -e 'imgur $f | xsel -b; rm -f $f'
else
   scrot -e 'imgur $f | xsel -b; rm -f $f'
fi
i3-nagbar -t warning -m "Screenshot saved to clipboard."

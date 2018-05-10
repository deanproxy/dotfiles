#!/bin/bash

temp_file="/tmp/screen.png"
overlays=("/home/dean/Scripts/rick-explain.png" "/home/dean/Scripts/rick.png")
width=1920
height=1080
blur=10
display="eDP1"
pos_h="(main_h-overlay_h)/2"
pos_w="(main_w-overlay_w)/2"

if (xrandr | grep "DP2-2 connected"); then
   display="DP2-2"
   width=2560
   height=1440
fi

overlay=${overlays[$((RANDOM % 2))]}
if [ "$overlay" == "/home/dean/Scripts/rick.png" ]; then
   pos_h="(main_h-overlay_h)"
   pos_w="(main_w-overlay_w)/2"
fi

ffmpeg -f x11grab -video_size "${width}x${height}" -y -i $DISPLAY -i $overlay -filter_complex "boxblur=${blur}:${blur},overlay=${pos_w}:${pos_h},boxblur=0:0" -vframes 1 $temp_file

i3lock -i $temp_file
rm -f $temp_file

# NOTE: below is a slower way to accomplish the same thing above
# if [ $((RANDOM % 2)) -eq 0 ]; then
   # nice -20 i3lock -i <(nice -20 import -silent -window root png:- | 
      # nice -20 mogrify -blur 0x20 png:- | nice -20 composite -gravity Center -geometry -20x1200 ~/Scripts/rick-explain.png png:- png:-)
# else
   # nice -20 i3lock -i <(nice -20 import -silent -window root png:- | nice -20 mogrify -blur 0x20 png:- | nice -20 composite -gravity South -geometry -20x1200 ~/Scripts/rick.png png:- png:-)
# fi

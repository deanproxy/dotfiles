#!/bin/bash

temp_file="/tmp/screen.png"
overlays=("/home/dean/Scripts/rick-explain.png" "/home/dean/Scripts/rick.png")
dimensions=`xdpyinfo | grep -oP 'dimensions:\s+\K\S+'`
blur=10
pos_h="(main_h-overlay_h)/2"
pos_w="(main_w-overlay_w)/2"

if [ -z "$dimensions" ]; then
   dimensions="1920x1080"
fi
overlay=${overlays[$((RANDOM % 2))]}
if [ "$overlay" == "/home/dean/Scripts/rick.png" ]; then
   pos_h="(main_h-overlay_h)"
   pos_w="(main_w-overlay_w)/2"
fi

nice -20 ffmpeg -f x11grab -video_size "${dimensions}" -y -i $DISPLAY -i $overlay -filter_complex "boxblur=${blur}:${blur},overlay=${pos_w}:${pos_h},boxblur=0:0" -vframes 1 $temp_file

xset +dpms dpms 0 0 900
i3lock -n -i $temp_file
xset -dpms
rm -f $temp_file

# NOTE: below is a slower way to accomplish the same thing above
# if [ $((RANDOM % 2)) -eq 0 ]; then
   # nice -20 i3lock -i <(nice -20 import -silent -window root png:- | 
      # nice -20 mogrify -blur 0x20 png:- | nice -20 composite -gravity Center -geometry -20x1200 ~/Scripts/rick-explain.png png:- png:-)
# else
   # nice -20 i3lock -i <(nice -20 import -silent -window root png:- | nice -20 mogrify -blur 0x20 png:- | nice -20 composite -gravity South -geometry -20x1200 ~/Scripts/rick.png png:- png:-)
# fi

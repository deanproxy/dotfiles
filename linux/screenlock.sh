#!/bin/bash

if [ $((RANDOM % 2)) -eq 0 ]; then
   nice -20 i3lock -i <(nice -20 import -silent -window root png:- | nice -20 mogrify -blur 0x20 png:- | nice -20 composite -gravity Center -geometry -20x1200 ~/Scripts/rick-explain.png png:- png:-)
else
   nice -20 i3lock -i <(nice -20 import -silent -window root png:- | nice -20 mogrify -blur 0x20 png:- | nice -20 composite -gravity South -geometry -20x1200 ~/Scripts/rick.png png:- png:-)
fi

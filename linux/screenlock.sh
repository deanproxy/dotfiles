#!/bin/bash

xset +dpms dpms 0 0 5
i3lock -i <(import -silent -window root png:- | mogrify -blur 0x20 png:- | composite -gravity South -geometry -20x1200 ~/Scripts/rick.png png:- png:-)
xset dpms 0 0 0

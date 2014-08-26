#!/bin/bash

git remote prune origin

exists=0
yorn='yes'
shopt -s nocasematch

for i in `git branch`; do 
    for j in `git branch -r`; do 
        if [ "origin/${i}" == $j ]; then 
            exists=1
            break 
        fi 
    done 
    if [ $exists == 0 ]; then
        if [ "$1" == '-i' ]; then
            echo -n "Delete $i? "
            read yorn
        else
            echo -n "Deleting $i: "
        fi
        if [ "$yorn" == "yes" ] || [ "$yorn" == "y" ]; then
            git branch -d "$i"
        fi
    fi
    exists=0
done


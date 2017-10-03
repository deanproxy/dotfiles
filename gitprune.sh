#!/bin/bash

TEMP=$(getopt -o 'ps' -- "$@")
exists=0
yorn='y'

git remote prune origin

eval set -- "$TEMP"
unset TEMP
while true; do 
   case "$1" in
      '-p')
         only_prune=1
         shift
         continue
         ;;
      '-s')
         only_stale=1
         shift
         continue
         ;;
      '--')
         shift
         break
   esac
done

IFS=$'\n'

# Prune branches
if [ -z $only_stale ]; then
   for i in $(git branch); do 
       i=$(echo ${i//[[:blank:]]/})
       if [ "${i:0:1}" == "*" ]; then
          # don't do branch we are currently on.
          continue
       fi
       for j in $(git branch -r); do 
           j=$(echo ${j//[[:blank:]]/})
           if [ "origin/$i" == "$j" ]; then 
               exists=1
               break 
           fi 
       done 
       if [ $exists == 0 ]; then
           if [ -z "$1" ] || [ "$1" != '-y' ]; then
               echo -n "Delete $i? "
               read yorn
           fi
           if [ "$yorn" == "yes" ] || [ "$yorn" == "y" ]; then
               echo -n "Deleting $i: "
               git branch -d "$i"
           fi
       fi
       exists=0
   done
fi

# Notify of possible stale branches.
if [ -z $only_prune ]; then
   today=`date +%s`
   five_days=432000
   for k in $(git branch -r | sed s/^..//); do 
      if [ "$k" != "origin/master" ] && [ "$k" != "origin/HEAD -> origin/master" ]; then
         date=`git log -1 --pretty=format:"%ci" $k --`
         secs=`date -d "${date}" +%s`
         diff=`expr $today - $secs`
         if [ $diff -ge $five_days ]; then
            if [ -z $display ]; then
               echo
               echo "--- Possible stale branches ---"
               display=1
            fi
            days=`expr $diff / 60 / 60 / 24`
            echo "$k is ${days} days old"
         fi
      fi
   done
fi

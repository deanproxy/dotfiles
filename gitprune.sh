#!/bin/bash

exists=0
yorn='y'

while getopts ":pshd:" o; do 
   case "${o}" in
      p)
         only_prune=1
         ;;
      s)
         only_stale=1
         ;;
      d)
         stale_days=${OPTARG}
         ;;
      h)
         echo "gitprune.sh [-p] [-s] [-d days]"
         echo "   -p - Prune Only. Prunes and asks if you want to delete local pruned branches."
         echo "   -s - Doesn't Prune or delete local branches. Asks if you want to delete stale remote branches."
         echo "        Can use the -d option to specify how many days a branch is stale by."
         echo "   -d days - How many days must a branch be stale before asking if you want to delete it."
         exit 0
         ;;
      *)
         ;;
   esac
done
shift $((OPTIND-1))

if [ -z "$stale_days" ]; then
   stale_days=5
fi
IFS=$'\n'

# Prune branches
if [ -z $only_stale ]; then
   git remote prune origin
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
   branches=()
   today=`date +%s`
   total_days=$(expr $stale_days \* 24 \* 60 \* 60)
   for k in $(git branch -r | sed s/^..//); do 
      if [ "$k" != "origin/master" ] && [ "$k" != "origin/HEAD -> origin/master" ]; then
         date=`git log -1 --pretty=format:"%ci" $k --`
         secs=`date -d "${date}" +%s`
         diff=`expr $today - $secs`
         if [ $diff -ge $total_days ]; then
            if [ -z $display ]; then
               echo
               echo "--- Possible stale branches ---"
               display=1
            fi
            days=`expr $diff / 60 / 60 / 24`
            branches+=("${days}:${k}")
            # echo "$k is ${days} days old"
         fi
      fi
   done

   IFS=$'\n' sorted=($(sort -n <<<"${branches[*]}"))
   for b in ${sorted[@]}; do
      days=$(echo $b | awk -F: '{print $1}')
      branch=$(echo $b | awk -F: '{print $2}')
      echo "$branch is $days days old"
   done

   if [ ${#sorted[@]} -eq 0 ]; then
      exit
   fi

   echo -n "Do you want to kill these? "
   read yorn
   if [ "$yorn" == "yes" ] || [ "$yorn" == "y" ]; then
      echo -n "For realsies? "
      read yorn
      if [ "$yorn" == "yes" ] || [ "$yorn" == "y" ]; then
         total=1
         for b in ${sorted[@]}; do
            days=$(echo $b | awk -F: '{print $1}')
            branch=$(echo $b | awk -F: '{print $2}' | awk -F/ '{st=index($0,"/");print substr($0,st+1)}')
            git push origin :"$branch"
            total=$(expr $total + 1)
            if [ $total -eq 30 ]; then
               sleep 60
               total=1
            fi
         done
      fi
   fi
fi

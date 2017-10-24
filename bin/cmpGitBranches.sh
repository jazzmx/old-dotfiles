#!/bin/bash

printUsage() {
   cat << EOM
 Usage:  $(basename $0) branch1 branch2
EOM
}

branch1=$1
branch2=$2
[ "$branch1" ] || { printUsage; exit 1; }
[ "$branch2" ] || { printUsage; exit 1; }
[ -z "$(git rev-parse --git-dir 2>/dev/null)" ] && { echo "Not a git repository." && exit 1; }

b1=$(git branch -a | grep "$branch1")
b2=$(git branch -a | grep "$branch2")
[ "$b1" ] && b1=$(git rev-parse $branch1)
[ "$b2" ] && b2=$(git rev-parse $branch2)

if [ "$b1" ] && [ "$b2" ]; then
   if [ "$b1" != "$b2" ]; then
      echo -e "\t\t$b1 != $b2"
   else
      echo -e "\t\t$branch1 = $branch2"
   fi
else
   [ "$b1" ] && echo -e "\t\t$branch1"
   [ "$b2" ] && echo -e "\t\t$branch2"
fi


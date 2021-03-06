#!/bin/bash

if [ $# -ne 3 ] ; then
    echo "usage: $0 <directory> <nameFunction> <output>"
    exit 1
fi

if [ ! -d $1 ] ; then
    echo "$1 isn't a directory"
    exit 1
fi

for file in $(find $1 -type f) ; do 
    grep -Hn -e "$2" $file
done > $3

tmp="$$.tmp"

sort -t: -k1,1 -s $3 > $tmp

mv $tmp $3

exit 0

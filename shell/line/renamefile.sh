#!/bin/bash

i=0;
for file in `ls`;
do 
    filename=`echo "$file" |grep -E '.png$'`
    echo $filename
    if [ -n "$filename" ]; then
        `mv "$filename" "${i}.png"`
        i=$((i+1));
    fi
done

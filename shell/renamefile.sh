#!/bin/bash

i=0;
for file in `ls`;
do 
    filename=`echo "$file" |grep -E '.jpg$'`
    echo $filename
    if [ -n "$filename" ]; then
        `cp "$filename" "${i}.jpg"`
        i=$((i+1));
    fi
done

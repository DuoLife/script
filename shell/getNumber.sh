#! /bin/bash
filename="$1"
echo $filename
for str in `cat "$filename"`;
do
#	echo $str
	if [[ -n `echo "$str" | grep -oE '[0-9]+'` ]]; then 
		echo `echo "$str" | grep -oE '[0-9]+'`
	fi

done

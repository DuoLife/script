#! /bin/bash
originDir=$1
dir="com.coldworks.emoticon."$originDir
passwd=$2
#init params
origin="origin"
thumb="thumb"
#check dir
if [[ -d $dir ]]; then
    echo "have"
else 
    `mkdir "$dir"`
    echo "don't have"
fi
if [[ -d "$dir/origin" ]]; then
    echo "have"
else 
    `mkdir "$dir/origin"`
    echo "don't have"
fi
if [[ -d "$dir/packagethumb" ]]; then
    echo "have"
else 
    `mkdir "$dir/packagethumb"`
    echo "don't have"
fi
if [[ -d "$dir/thumb" ]]; then
    echo "have"
else 
    `mkdir "$dir/thumb"`
    echo "don't have"
fi
#读取包缩略图，并生成md5文件名
for f in `ls "$originDir/packagethumb" | grep -E '.*png'`;
do 
    if [ -n "$f" ]; then
        #newFile=`md5sum "$f" | grep -oE "^.{32}"`
        `cp "$originDir/packagethumb/$f" "$dir/packagethumb/$dir.pic.thumb"`
    fi
done
#读取表情，并生成md5文件名
for f in `ls "$originDir/$origin" | grep -E '.*gif|png'`;
do 
    if [ -n "$f" ]; then
        newFile=`md5sum "$originDir/$origin/$f" | grep -oE "^.{32}"`
        `cp "$originDir/$origin/$f" "$dir/origin/$newFile.pic"`
    fi
done
#读取表情缩略图，并生成md5文件名
for f in `ls "$originDir/$thumb" | grep -E '.*png|jpg'`;
do 
    if [ -n "$f" ]; then
    newFile=`md5sum "$originDir/$thumb/$f" | grep -oE "^.{32}"`
    `cp "$originDir/$thumb/$f" "$dir/thumb/$newFile.pic.thumb"`
    fi
done
if [[ -d $dir ]];then
    echo "$dir"
    `zip -r -P $passwd "$dir.zip" "$dir"`
fi

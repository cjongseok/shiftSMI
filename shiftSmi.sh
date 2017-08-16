#!/bin/bash

usage() {
    echo "usage: $0 <SMI_PATH> <DELAY_IN_MS>"
    exit 1
}

smiFilePath=$1
delay=$2

# check arguments
if [ "$#" -ne 2 ]; then
    usage
fi

if ! [ -f $smiFilePath ]; then
    echo "File($smiFilePath) Not Exist"
    usage
fi

re='^-*[0-9]+$'
if ! [[ $delay =~ $re ]]; then
    echo "DELAY($delay) is NOT an Integer"
    usage
fi

# Overwrite the output file
outFilePath="$(dirname $1)/SHIFTED-$(basename $1)"
if [ -f $outFilePath ]; then
    printf "$outFilePath already exists!. Do you want to overwrite it [Y/n]? "
    read overwrite
    if [[ $overwrite == "Y" ]] || [[ $overwrite == "y" ]]; then
        rm $outFilePath > /dev/null 2>&1
    else
        echo "Shifting Failure: Overwriting is Aborted."
        exit 1
    fi
else
    touch "$outFilePath"
fi

# Shift
printf "Start shifting ... "
while ifs='' read -r line || [[ -n "$line" ]]; do
    grepped=""
    grepped=$(echo $line | grep "<SYNC Start=")
    if [ -n "$grepped" ]; then
        #echo "line: $line"
        timestamp=$(echo $line | sed 's/<SYNC Start=\([0-9]*\).*/\1/g');
        timestamp=$((timestamp+delay))
        shifted=$(echo $line | sed 's/\(.*<SYNC Start=\)[0-9]*\(.*\)/\1'"$timestamp"'\2/g');
        #echo "shifted: $shifted"
        echo $shifted >> "$outFilePath"
    else
        echo $line >> "$outFilePath"
    fi
done < "$smiFilePath"

printf "DONE!\n"
echo "Shifted SMI is: $outFilePath"

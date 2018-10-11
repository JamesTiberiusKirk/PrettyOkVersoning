#!/bin/bash

#This will be used for file manipulation.

echo "This is ${0}"

printHelp(){
    echo "This is file component"
}


while getopts h-help aflag; do
    case $aflag in 
    h) printHelp;;
    -help) printHelp;;
    esac
done

file1=""
file2=""

echo "Insert the name of the first file you want to compare, followed by .txt"
read file1
echo "Insert the name of the second file you want to compare, followed by .txt"
read file2

if [ -f "$file1" ]
then
	echo "Success"
else
	echo "First file was not found"
fi

if [ -f "$file2" ]
then
else
	echo "Second file was not found"
fi

choice=Y

echo "Would you like to view the conflicts? [Y/n]"
read choice
echo "The choice is: $choice"

if [ "$choice"==Y ]
then
	vimdiff -c --report-identical-files "$file1" "$file2"
fi
if [ "$choice"==n ]
then
	differenceVar= "$(vimdiff -c --report-identical-files "file1" "file2")"
fi

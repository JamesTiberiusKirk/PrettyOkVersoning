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


file1="${1}"
file2="${2}"
choice="Y"
pos="Y"
neg="n"

echo "Would you like to view the conflicts? [Y/n]"
read choice

if [ "${choice}" == "Y" ]
then
	vimdiff -c --report-identical-files "file1" "file2"
fi
if [ "${choice}" == "n" ]
then
differenceVar= "$(vimdiff -c --report-identical-files "file1" "file2")"
fi

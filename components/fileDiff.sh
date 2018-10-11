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
touch differenceFile.txt

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
	echo "Success"
else
	echo "Second file was not found"
fi

 checkChoice()
{
choice=""

echo "Would you like to view the conflicts? [Y/n]"
read choice
echo "The choice is: $choice"
#emptying a file
>differenceFile.txt
if [ "$choice" == "Y" ]; 
then
	diff -y "$file1" "$file2"
	diff -y "$file1" "$file2" >> differenceFile.txt

elif [ "$choice" == "n" ];
 then
	diff -y "$file1" "$file2" >> differenceFile.txt

else
	echo "Invalid choice, please try again:"
	checkChoice
fi
}
checkChoice
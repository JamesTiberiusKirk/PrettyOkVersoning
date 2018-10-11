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
differenceVar=""

echo "Insert the name of the first file you want to compare, followed by .txt"
read file1
echo "Insert the name of the second file you want to compare, followed by .txt"
read file2

if [ -f $repo$file1 ]
then
	echo "Success"
else
	echo "First file was not found"
fi

if [ -f $repo$file2 ]
then
	echo "Success"
else
	echo "Second file was not found"
fi


 checkChoice()
{

choice=""
d="difference.txt"
echo "Would you like to view the conflicts? [Y/n]"
read choice
echo "The choice is: $choice"

if [ "$choice" == "Y" ]; 
then
	diff -y $repo$file1 $repo$file2
	diff -y $repo$file1 $repo$file2 >> $repo$d

elif [ "$choice" == "n" ];
 then
	diff -y $repo$file1 $repo$file2 >> $repo$d

else
	echo "Invalid choice, please try again:"
	checkChoice
fi
}
checkChoice
diff -y $repo$file1 $repo$file2 >> differenceVar
export differenceVar
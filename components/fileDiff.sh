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

#variable in which the name of the first file will be stored
file1=""
#variable in which the name of the second file will be stored
file2=""
#variable in which the difference between two files will be stored
differenceVar=""

echo "Insert the name of the first file you want to compare, followed by .txt"
#getting the name of the first file
read file1
echo "Insert the name of the second file you want to compare, followed by .txt"
#getting the name of the second file
read file2
#if statement used to check that the first file is inside the repository
if [ -f $repo$file1 ]
then
	#if the file has been found this message will be displayed
	echo "The first file has been found successfully."
else
	#if the file has not been found this message will be displayed
	echo "First file was not found"
fi
#if statement used to check that the second file is inside the repository
if [ -f $repo$file2 ]
then
	#if the file has been found this message will be displayed
	echo "The second file has been found successfully."
else
	#if the file has not been found this message will be displayed
	echo "Second file was not found"
fi

#function used to check
checkChoice()
{
#variable used to store the choice of the user
choice=""
#variable used to store the name of the document containing the differences between files
d="difference.txt"
echo "Would you like to view the conflicts? [Y/n]"
#getting the choice from the user
read choice
echo "The choice is: $choice"
#if statement to check if the user wants to be shown the differences between the two files
if [ "$choice" == "Y" ]; 
then
	#the following lines of code show the user the differences between the two files and also store the result into the difference file inside the repository
	diff -y $repo$file1 $repo$file2
	diff -y $repo$file1 $repo$file2 >> $repo$d

elif [ "$choice" == "n" ];
then
	#the following line of code stores the result of the differences between the two files into the difference file inside the repository
	diff -y $repo$file1 $repo$file2 >> $repo$d

else
	#error message telling the user to choose between the two available options
	echo "Invalid choice, please try again:"
	#calling the checkChoice again
	checkChoice
fi
}
#asking the user to make a choice
checkChoice
#the following line of code stores the result of the differences between the two files into the difference variable
diff -y $repo$file1 $repo$file2 >> differenceVar
#exporting the variable to be used in other scripts
export differenceVar
#!/bin/bash

#This script checks files that have been edited and the user responsible for it

repo=/home/costin/repositories/cosRepo/

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "File management Menu"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "1. Create a new file."
echo "2. Edit a file."
echo "3. Delete a file."
echo "4. Show the content of a file"
echo "5. Show differences between two files."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Please choose one of the previous options"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

function userChoice()
{

hello="hellooo"
echo "$repo$hello"
option=""
read option
if [ "$option" -eq 1 ]
then 
	echo "Insert the name of the file you want to create, followed by .txt:"
	name=""
	read name
	touch $repo$name
	if [ -f $repo$name ]
	then
		echo "File created successfully."
	fi
elif [ "$option" -eq 2 ]
then
	echo "Insert the name of the file you want to edit, followed by .txt:"
	nameEdit=""
	d=$(date +%Y-%m-%d-%T-)
	b="backup-"
	userName=$(whoami)
	comments=""
	read nameEdit
	if [ -f $repo$nameEdit ]
	then
		echo "found"
		cp $repo$nameEdit $repo$b$d$nameEdit
		nano "$repo$nameEdit"
	fi
	log="logFile.txt"
	touch $repo$log
	echo "Please explain the changes done to the file"
	read comments
	echo "Accessed by: "$userName" , Date: "$d" , Comments: "$comments" , Differences: " >> $repo$log
	diff -y $repo$nameEdit $repo$b$d$nameEdit >> $repo$log

elif [ "$option" -eq 3 ]
then 
	echo "Insert the name of the file you want to delete, followed by .txt:"
	nameDel=""
	read nameDel
	rm $repo$nameDel
	if [ -f $repo$nameDel ]
	then
		echo "File has not been deleted"
	fi
elif [ "$option" -eq 4 ]
then 
	echo "Insert the name of the file you want to view, followed by .txt:"
	nameF=""
	read nameF
	cat $repo$nameF
elif [ "$option" -eq 5 ]
then 
	source fileDiff.sh
else
	echo "Invalid option, please try again"
	userChoice
fi
}

userChoice
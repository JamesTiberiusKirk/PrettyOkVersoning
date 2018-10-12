#!/bin/bash

#This script shows a file management menu to the user
#it allows to create, edit, delete, compare and show the content of files

repo=$REPO_DIR/$SELECTED_REPO

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

#function used to process the user's choice
function userChoice()
{

#variable used to store the choice of rhe user
option=""

#getting the choice from the user, the choice being a number between 1 and 5
read option

#if statement responsible for processing the user's choice
if [ "$option" -eq 1 ]
then 
	echo "Insert the name of the file you want to create, followed by .txt:"
	#variable used to store the name of the file to be created
	name=""
	#getting name for the file from the user
	read name
	#creating the file inside the repository variable
	touch $repo$name
	#if statement used to check if the file was created
	if [ -f $repo$name ]
	then
		echo "File created successfully."
	fi

elif [ "$option" -eq 2 ]
then
	echo "Insert the name of the file you want to edit, followed by .txt:"
	#variale used to store the name of the file to be edited
	nameEdit=""
	#variable to store the date and the time
	d=$(date +%Y-%m-%d-%T-)
	#variable used to store the name of a backup file
	b="backup-"
	#variable used to store the name of the user being editing the file
	userName=$(whoami)
	#variable to store the comments on the edited file
	comments=""
	#getting the name of the file to bes stored
	read nameEdit
	#if statement used to find the file to be edited in the repository
	if [ -f $repo$nameEdit ]
	then
		echo "The file has been found!"
		#creating a copy of the file in order to create a backup file before the file to be edited
		cp $repo$nameEdit $repo$b$d$nameEdit
		#allowing the user to edit the file
		nano "$repo$nameEdit"
	fi
	#variable to store the name of the log file, where all the changes in the repository will be stored
	log="logFile.txt"
	#creating a log file inside the repository
	touch $repo$log
	echo "Please make a short description of the changes done to the file"
	#getting the comments from the user
	read comments
	#saving the name of the user being editing the file, the date and the time, the comments
	echo "Accessed by: "$userName" , Date: "$d" , Comments: "$comments" , Differences: " >> $repo$log
	#saving the differences between the backup file and the newly edited file inside the log file inside the repository
	diff -y $repo$nameEdit $repo$b$d$nameEdit >> $repo$log

elif [ "$option" -eq 3 ]
then 
	echo "Insert the name of the file you want to delete, followed by .txt:"
	#variable to store the name of the file to be deleted
	nameDel=""
	#getting the name of the file to be deleted
	read nameDel
	#deleting the file inside the repository
	rm $repo$nameDel
	#if statement used to check if the file has been deleted, giving an error message if it has not been deleted
	if [ -f $repo$nameDel ]
	then
		echo "File has not been deleted"
	fi

elif [ "$option" -eq 4 ]
then 
	echo "Insert the name of the file you want to view, followed by .txt:"
	#variable to store the name of the file to be shown its content
	nameF=""
	#getting the name of the file to be shown its content
	read nameF
	#showing content of the file from the repository
	cat $repo$nameF

elif [ "$option" -eq 5 ]
then 
	#calling the fileDiff script that will allow the user to observe the difference between two files
	source fileDiff.sh

else
	#if the user has chosen a number that it is not between 1 and 5, an error message will appear, asking the user to input a valid number
	echo "Invalid option, please try again"
	#asking the user to input a new number
	userChoice
fi
}
#calling the userChoice function to allow the user to manage files in the repository
userChoice
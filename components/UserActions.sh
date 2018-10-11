#!/bin/bash

#This script checks files that have been edited and the user responsible for it

cat differenceFile.txt

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "File management Menu"
echo "1. Create a new file."
echo "2. Edit a file."
echo "3. Delete a file."
echo "4. Show the content of a file"
echo "5. Show differences between two files."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Please choose one of the previous options"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

option=""
read option

if [ "$option" -eq 1 ]
then 
	"Insert the name of the file you want to create, followed by .txt:"
	name=""
	read name
	touch $name
	if [ -f "$name" ]
	then
		echo "File created successfully."
	fi
elif [ "$option" -eq 2 ]
then
	"Insert the name of the file you want to edit, followed by .txt:"
	nameEdit=""
	read nameEdit
	if [ -f "$nameEdit" ]
	then
		nano "$nameEdit"
	fi
elif [ "$option" -eq 3 ]
then 
	"Insert the name of the file you want to delete, followed by .txt:"
	nameDel=""
	read nameDel
	rm $nameDel
	if [ -f "$nameDel" ]
	then
		echo "File created successfully."
	fi

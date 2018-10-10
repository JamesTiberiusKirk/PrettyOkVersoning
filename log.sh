#!/bin/bash

 Desktop=/components/logNames.log

source fileDiff.sh

echo "This is ${0}"

options=""
usrName=""
modDate=""

  usrName=$USER
  modDate=$(date)
echo " chose one of the options below:
		-u to record the user name and changes that has been made
		-e To perform error check 
		-s To print differences. 
		-h for help and additional information
		-q for quit"

read -p "Pick an option from above " options

while $options u:e:s:h-help aflag; do
    case $aflag in
    u) usrLogs;;
    e) printErr;;
    s) printStd;; 	
    h) printHelp;;
    esac
done


#This will be used for the logging system.

 
  

function usrLogs
{
	

  if [ -f "$Desktop" ];
	then 
	touch logNames.log
		
	echo "$usrName">>"$Desktop"

	echo "$modDate">>"$Desktop"

	echo "differenceVar" >> "$Desktop"
	

	echo "Changes has been made to the log file " 
	else 
	echo "Failed to write the name :("
	fi
	

	cat logNames.log

}

function printErr()
{
	if [ "$usrName"!= "$USERs" && "$modDate"!="$(date)" ]; 
	then
	echo "Your computer ran into some problems"
	
 	fi
}


function printStd()
{
echo "Here are the recent changes"

cat logNames.log
}


function printHelp()
{
echo "**********************************
	welcome to Github alike program, this 
	program allows users to create a new 
	repository, with user names and keeps
	 track of dates and versions
	 ***********************************
	 " 
}
 




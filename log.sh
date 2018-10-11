#!/bin/bash
#TRACK_LOG="repoLog/repoTrack.log"
FILE_DIFF="fileDiff.sh"
TRACK_LOG="repoTrack.log"

source fileDiff.sh
echo "This is ${0}"


usrName=""
modDate=""

  usrName=$USER
  modDate=$(date)


#This will be used for the logging system.

 echo " chose one of the options below:
		-u to record the user name and changes that has been made
		-e To perform error check 
		-s To print differences. 
		-h for help and additional information
		-q for quit"
  

function usrLogs
{

	
  if [ -f "$TRACK_LOG" ];
	then 
	echo "$usrName">>"$TRACK_LOG"

	echo "$modDate">>"$TRACK_LOG"

	echo "$differenceVar" >> "$TRACK_LOG"
	

	echo "Changes has been made to the log file " 
	else 
	echo "Failed to write the name :("
	fi
	

	cat repoTrack.log

}

function printErr
{
	if [ "$usrName" == "$USER" ]; 
	then
		echo "Correct user name"
	 	usrLogs
	else 
		echo "Your computer ran into some problems"
 	fi

}


function printStd
{
echo "Here are the recent changes to files and User names "

cat repoTrack.log
}


function printHelp
{
echo "**********************************
	welcome to Github alike program, this 
	program allows users to create a new 
	repository, with user names and keeps
	 track of dates and versions
	 ***********************************
	 " 
}
 
 


while getopts uesh aflag;do
    case "$aflag" in
    u) usrLogs
	;;
    e) printErr
	;;
    s) printStd
	;; 	
    h) printHelp
	;;
    esac
done





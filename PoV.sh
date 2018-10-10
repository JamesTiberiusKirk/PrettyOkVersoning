#!/bin/bash

#This will be the main entry point of the scripted program.
#Here we will mostly be parsing the different input parameters 
#that user gives and riderecting them to other scripts.
#Also gonna add a --help option here

#These are variables for the paths to the compoments
COMPPATH="./components/"
USER="user.sh"
FILE_DIFF="fileDiff.sh"
LOG="log.sh"
CHECK="check.sh"
REPO="repo.sh"

REPO_STORE="${HOME}/repositories/"
FILES_LIST="repoLog/fileList"
FILE_CHECK="repoLog/fileCheckOut"
TRACK_LOG="repoLog/repoTrack.log"


function printHelp(){
    HELP_MAIN= "
    Welcome to the Pretty OK Versioning system.
    Usage:
      ./PoV.sh [option] [flags]
    Options and their flags:
      repo
        -n [name] for a new repo
        -a [file/directory name] to add a file to the version tracking
    "
    echo $HELP_MAIN
}

case $1 in
    file) sh ${COMPPATH}${FILE} $2 $3 $4 $5;;
    f) sh ${COMPPATH}${FILE} $2 $3 $4 $5;;
    
    user) sh ${COMPPATH}${USER} $2 $3 $4 $5;;
    u) sh ${COMPPATH}${USER} $2 $3 $4 $5;;
    
    log) sh ${COMPPATH}${LOG} $2 $3 $4 $5;;
    l) sh ${COMPPATH}${LOG} $2 $3 $4 $5;;
    
    check) sh ${COMPPATH}${CHECK} $2 $3 $4 $5;;
    c) sh ${COMPPATH}${CHECK} $2 $3 $4 $5;;

    push) sh $REPO -p;;
esac

while getopts u:h-help aflag; do
    case $aflag in 
        h) printHelp;;
        -help) printHelp;;
        -u) 
            REPO_SELECT=$OPTARGS
            checkRepo;;
    esac
done

function checkRepo(){
    if [[ ! -d $REPO_SELECT]]
    then 
        echo "Please enter an existing repository or create a new one."
        REPO_SELECT=""
        exit 1
    fi
    echo "Repository ${REPO_SELECT} selected"
}
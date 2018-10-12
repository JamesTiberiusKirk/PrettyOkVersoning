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

REPO_DIR="${HOME}/repositories/"
FILES_LIST="repoLog/fileList"
FILE_CHECK="repoLog/fileCheckOut"
TRACK_LOG="repoLog/repoTrack.log"
LOG_FOLDER="repoLog"

SELECTED_REPO="$1"


function printHelp(){
    #TODO: NEED TO WORK ON THIS
    HELP_MAIN= "
    Welcome to the Pretty OK Versioning system.
    Usage:
      ./PoV.sh [option]:[options]
        new <new repository>                                        - to create a new repository
        list                                                        - to list all repositories

      ./Pov.sh <working repository> [options]:[options]
        <working repository> clone <path to user project folder>    - clones the repo from repositories folder to a user folder
        <working repository> add <file path>                        - enters a new file to the file list
        <working repository> filemon                                - interactive menu for file manipulation
    "
    echo $HELP_MAIN
}

case $1 in
     new)
        SELECTED_REPO=""
        . ${COMPPATH}${REPO} new $2 $3 $4 $5;;
    list)
        SELECTED_REPO=""
        . ${COMPPATH}${REPO} list;;
    "")
        printHelp;;
esac

case $2 in
    user)
        . ${COMPPATH}${USER} $3 $4 $5;;
    
    log)
        . ${COMPPATH}${LOG} $3 $4 $5;;
    
    check)
        . ${COMPPATH}${CHECK} $3 $4 $5;;

    push)
        . ${COMPPATH}${REPO} push;;

    clone)
        . ${COMPPATH}${REPO} clone $4;;

    add)
        . ${COMPPATH}${REPO} add $4;;

esac


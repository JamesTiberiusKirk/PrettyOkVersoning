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
USER_ACTIONS="UserActions.sh"

REPO_DIR="${HOME}/repositories/"
TRACK_LOG="repoLog/repoTrack.log"
LOG_FOLDER="repoLog"
FILE_CHECK="checkedOutFiles"

SELECTED_REPO="$1"


printHelp(){
    #TODO: NEED TO WORK ON THIS
    HELP_MAIN= "
    Welcome to the Pretty OK Versioning system.
    Usage:
      ./PoV.sh [option]:[options]
    Options and their suboptions:
      repo
        -n [name] for a new repo
        -a [file/directory name] to add a file to the version tracking
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
    user). ${COMPPATH}${USER} $3 $4 $5;;
    
    log). ${COMPPATH}${LOG} $3 $4 $5;;
    
    check). ${COMPPATH}${CHECK} $3 $4 $5;;

    push). ${COMPPATH}${REPO} push;;

    clone). ${COMPPATH}${REPO} clone $3;;

    add). ${COMPPATH}${REPO} add $3;;
    
    filemon). ${COMPPATH}${USER_ACTIONS};;
    
    test)
        echo $USR_SELECT;;
esac


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

SELECTED_REPO="$1"

function printHelp(){
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
        sh ${COMPPATH}${REPO} new $3 $4 $5;;
    list)
        SELECTED_REPO=""
        sh ${COMPPATH}${REPO} list;;
esac

case $2 in
    user) bash ${COMPPATH}${USER} $3 $4 $5;;
    
    log) bash ${COMPPATH}${LOG} $3 $4 $5;;
    
    check) bash ${COMPPATH}${CHECK} $3 $4 $5;;

    push) bash ${COMPPATH}${REPO} push;;

    clone) bash ${COMPPATH}${REPO} clone $4;;

    add) bash ${COMPPATH}${REPO} add $4;;

    test)
        echo $USR_SELECT;;

    "") printHelp;;
esac


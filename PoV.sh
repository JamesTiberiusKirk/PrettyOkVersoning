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

function checkRepo(){
    echo $(${REPO_STORE}${REPO_SELECT})
    if [[ ! -a $(${REPO_STORE}${REPO_SELECT}) ]]
    then 
        echo "Please enter an existing repository or create a new one."
        REPO_SELECT=""
        exit 1
    fi
    echo "Repository ${REPO_SELECT} selected"
}

case $1 in
    use)
        REPO_SELECT= $3
        checkRepo;;

    user) sh ${COMPPATH}${USER} $2 $3 $4 $5;;
    u) sh ${COMPPATH}${USER} $2 $3 $4 $5;;
    
    log) sh ${COMPPATH}${LOG} $2 $3 $4 $5;;
    l) sh ${COMPPATH}${LOG} $2 $3 $4 $5;;
    
    check) sh ${COMPPATH}${CHECK} $2 $3 $4 $5;;
    c) sh ${COMPPATH}${CHECK} $2 $3 $4 $5;;

    push) sh ${COMPPATH}${REPO} push;;

    new) sh ${COMPPATH}${REPO} new $3 $4 $5;;

    clone) sh ${COMPPATH}${REPO} clone $3;;

    add) sh ${COMPPATH}${REPO} add $3;;

    "") printHelp;;
esac


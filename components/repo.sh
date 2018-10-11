#!/bin/bash

echo "This is ${0}"

#OFF FOR NOW
# while getopts n:h-help aflag; do
#     case $aflag in 
#         n) 
#             NAME= $OPTARG
#             newRepo;;
        
#         push)
#             push;;

#         pull)
#             pull;;
        
#         clone)
#             $DIR= $OPTARG
#             clone;;
        
#         add)
#             $NEW_FILE= $OPTARG
#             add;;

#         h) 
#             printHelp;;
#         -help) printHelp;;
#     esac
# done

case $1 in
    new)
        NAME= $2
        newRepo;;
    pull)
        pull;;
    push)
        push;;
    clone)
        DIR= $3
        clone;;
    add)
        NEW_FILE= $2
        add;;
    select)
        WORKING_REPO= $2;;
esac


while getopts h-help aflag; do
    case $aflag in 
        h) 
            printHelp;;
        -help) 
            printHelp;;
    esac
done


function printHelp(){
    echo "This is the repo manager."
}

#This just simply creates a new repo in the repo folder
function newRepo(){
    if [[! -a $REPO_DIR]]
    then
        mkdir $REPO_DIR
    fi
    #Checking is the new repo name already exists
    if [[-a $REPO_DIR/$(basename $NAME)]]
    then
        echo "Repository already exists.
        Please provide a unique name."
        exit 1
    fi
    
    #Creating a new directories for the repo
    mkdir $REPO_DIR/$(basename $NAME)
    touch $REPO_DIR/$(basename $NAME)/$TRACK_LOG
    touch $REPO_DIR/$(basename $NAME)/$FILES_LIST
}

function push(){
    #Check which file from user are different to the repo
    #Let the user know that a certain file has a missing line, removed line or a confligt.
        #in case of a confligt, exit the function and let user deal with confligt
    #Copy the modified files from users local repo to the repo storage
}

function pull(){
    #Check which file from repo are different to user
    #Let the user know that a certain file has a missing line, removed line or a confligt.
        #in case of a confligt, exit the function and let user deal with confligt
    #Copy the modified files from users local repo to the repo storage
}

#This clones an existing repo into a desired path 
function clone(){
    #Checking is the directory exists
    if [[ -a $DIR ]]
    then 
        echo "Please select a new direcory to clone the repo into."
        exit 1
    fi

    cp $REPO_DIR/$WORKING_REPO $DIR/
}

#Lists all of the directories
function list(){
    ls $REPO_DIR/
}

#Adds a file to the file list
function add(){
    #Checking if the file exists
    if [[ ! -a $NEW_FILE]]
    then
        echo "File or directory doesnt exist.
        Please give the path to an existing file or directory you want to include into the repository."
        exit 1
    fi
    
    if [[! -a $WORKING_REPO/$FILE_LIST]]
    then
        echo "Repo file list missing."
        exit 1
    fi

    while read LINE
        if[[ $WORKING_REPO/$NEW_FILE == $LINE]]
        then 
            echo "File already exists in the repository, please enter a unique name/path."
            exit 1
        fi
    done < $WORKING_REPO/$FILE_LIST

    echo -e "${NEW_FILE}\n">$WORKING_REPO/$FILES_LIST
    pull
}

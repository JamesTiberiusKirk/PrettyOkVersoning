#!/bin/bash
echo "This is ${0}"

printHelp(){
    echo "This is the repo manager."
}

#This just simply creates a new repo in the repo folder
newRepo(){
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

# function push(){
#     #Check which file from user are different to the repo
#     #Let the user know that a certain file has a missing line, removed line or a confligt.
#         #in case of a confligt, exit the function and let user deal with confligt
#     #Copy the modified files from users local repo to the repo storage
# }

# function pull(){
#     #Check which file from repo are different to user
#     #Let the user know that a certain file has a missing line, removed line or a confligt.
#         #in case of a confligt, exit the function and let user deal with confligt
#     #Copy the modified files from users local repo to the repo storage
# }

#This clones an existing repo into a desired path 
clone(){
    #Checking if the repo is present in the repo folder
    if [ ! -d $REPO_DIR/$SELECTED_REPO]
    then
        echo "Repository selected doesnt exist"
        exit 1
    fi
    
    #Checking is the directory exists
    if [[ -d $DIR ]]
    then 
        echo "Please select a new direcory to clone the repo into."
        exit 1
    fi

    cp $REPO_DIR/$SELECTED_REPO $DIR/
}

#Lists all of the directories
list(){
    ls $REPO_DIR/
}

#Adds a file to the file list
add(){
    #Checking if the file exists
    if [ ! -a $NEW_FILE]
    then
        echo "File or directory doesnt exist.
        Please give the path to an existing file or directory you want to include into the repository."
        exit 1
    fi
    
    #Checking for the filelist
    if [[! -a $SELECTED_REPO/$FILE_LIST]]
    then
        echo "Repo file list missing."
        exit 1
    fi

    while IFS= read -r LINE
    do
        if [ $SELECTED_REPO/$NEW_FILE == $LINE]
        then 
            echo "File already exists in the repository, please enter a unique name/path."
            exit 1
        fi
    done < "$SELECTED_REPO/$FILE_LIST"  

    echo -e "${NEW_FILE}\n">$SELECTED_REPO/$FILES_LIST
    pull
}

case $1 in
    new)
        NAME= $2
        newRepo();;
    pull)
        pull();;
    push)
        push();;
    clone)
        DIR= $2
        clone();;
    add)
        NEW_FILE= $2
        add();;
esac
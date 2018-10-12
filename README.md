# PrettyOkVersoning  
This bash script is for a module assignment in University of Dundee.  

## TODO:  
### Tasks:
- [] Create a file repository 
- [] Consider the basic structure of the scripts (how they are structured)
    - I think we should make it argument based (minimize the use of menus)
    - Whatever way we go, the script should be able to create/delete repos
    - [x] Create a basic layout of all of the script files
- [] A way to add new files
- [] Create a logging system
    - [] detect when a file was accessed and automatically log it
    - [] the log should contain other details such as who accessed it, when, why, and what part of the file were modified
- [] Make a checking in/out system, where it lets other devs know that the file is being worked on
    - [] Multiple devs working on the same file will be an advanced feature
- [] Users should be able to add other used to the contributors lists

### Features (From the assignment brief):
#### Standard Functionality  
The minimal functionality that your solution should be able to demonstrate is:  
- [x] a menu front end (individual scripts are also acceptable) or argument based
- [x] access a file repository
- [x] view a list of the files within the repository
- [x] logging a file out of the repository, and back in again
- [x] creation of a log file with updates  (WORKING ON IT)

#### Simple Extensions  
There are many possible extensions that you could pursue, such as:  
- [] multi-level menus
- [] allowing access to multiple repositories (accessed by name)
- [] being able to edit a text file from within your script
- [] some form of validation on what the user inputs e.g. “invalid entry” or “that file was not found”
- [] automatically listing the contents of the file repository currently in use
- [] optionally adding user comments into log entries
- [] automatically making backup copies of each file which is edited  

#### Further Extensions  
More advanced extensions could include:  
- [] providing secure access to sets of files, exploiting the user ID and group ID stored by UNIX (you may need to arrange to have several accounts created for you to test this extension)
- [] roll back i.e. return to an earlier version of the file(s), either by undoing the edits or by restoring an earlier version of the file(s)
- [] a facility to archive a whole project into a TAR or ZIP file (and possibly to access existing archive file)
- [] integrating other tools into your scripts, for example, to allow you to compile a project from its source code  

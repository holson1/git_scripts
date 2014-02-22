git_scripts
===========

Scripts for simplifying and automizing git commits and pulls


qcommit.sh - Version 1.0
**********

Grabs copies of .java and .class files located in an Eclipse workspace, puts them in their respective git folders,
and commits to git.

Usage: ./qcommit.sh [folders]

- enter any number of folders to update. If this argument is left blank, all folders in the default "folderArr" will be
  updated and committed
- This file should sit in the Documents folder
- Future changes: allow for easier user configuration of git folder directories and Eclipse workspace directory

**********

gitgrab.sh - Version 1.0
**********

Pulls changes from specified github folders, transfers them to their respective folders, and pushes these changes out to 
their respective tomcat containers. If changes were made, this script then restarts tomcat to make changes visible. 

- Intended to be run by a crontab. In my instance, I run it every minute so that once I make changes on my development end and push them out to github, I can immediately see the effects on my server.

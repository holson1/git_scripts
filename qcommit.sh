#!/bin/sh

#adds, commits, and pushes files in a git folder
#Henry Olson, 2014

#if the number of parameters entered is greater than 0
if [ $# -gt 0 ]
then
	#populate folderArr with the parameters
	folderArr=$@
else
	#enter default git folders here
	folderArr=(FirstApp HelloApp)
fi

for folder in ${folderArr[*]}
do
	#start at documents
	cd ~/Documents
	echo $folder

	#check for git folder
	if [ ! -d $folder ]
	then
		echo "Error: folder $folder not found.\n"
		continue	
	fi

	#copy all source and binary files to the git folder
	find ./workspace/$folder -type f -name '*.java' -exec cp {} ~/Documents/$folder \;
	find ./workspace/$folder -type f -name '*.class' -exec cp {} ~/Documents/$folder \;	

	cd ~/Documents/$folder

	#commit
	git add -A .
	git commit -m "Committed by qcommit.sh"
	git push origin master

	echo ""
done

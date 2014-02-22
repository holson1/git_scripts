#!/bin/bash

#	Pulls changes from github and copies them to the appropriate tomcat container
#	Henry Olson, 2014

changes=0

#app names and classes go in this key->value associative array
declare -A aa
aa["FirstApp"]="formServlet"
aa["HelloApp"]="helloServlet"

#loop through associative array
for n in "${!aa[@]}" 
do
	cd /Documents/$n

	#only update if there is something to grab
	git fetch origin
	x=$(git diff master origin/master)
	if [ -z "$x" ]
	then
		continue	
	fi

	#pull changes and copy to tomcat directory	
	git pull https://github.com/holson1/$n.git master
	cp -u ${aa[$n]}.class /opt/apache-tomcat-7.0.47/webapps/$n/WEB-INF/classes/

	#if we made it here, there have been changes warranting a restart
	changes=1
done

#restart tomcat to see changes
if [ $changes -eq 1 ]
then
	service tomcat restart
fi

#!/usr/bin/env bash
if [ -f "software/counter_25.war" ]
then
        
	echo "Building the JBoss EAP 6.2.3 container for workshop"
	docker build -t eap .
else
	echo "File software/counter_25.war not found."
        exit 0
fi

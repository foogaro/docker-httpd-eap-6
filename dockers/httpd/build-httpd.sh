#!/usr/bin/env bash
if [ -f "software/mod_cluster.conf" ]
then
        
	echo "Building the Apache HTTPD container for workshop"
	docker build -t httpd .
else
	echo "File software/mod_cluster.conf not found."
        exit 0
fi

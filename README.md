# Dockering JBoss EAP 6 and Apache HTTPD
This project builds two [docker](http://www.docker.io) containers for running [JBoss EAP 6.2.0.GA](http://www.redhat.com/products/jbossenterprisemiddleware/application-platform/) and [Apache HTTPD 2.2](http://httpd.apache.org)

## Prerequisites
1. Install [Docker](https://www.docker.io/gettingstarted/#1)
2. Download the official CentOS image from the [docker-repository](https://www.docker.io/gettingstarted/#1)
2. Download Dockerfile from my [github](https://github.com/foogaro/docker-httpd-eap-6)
3. Download JBoss EAP 6.2.0.GA from [jboss.org.](http://www.jboss.org/download-manager/file/jboss-eap-6.2.0.GA-installer.jar)
2. Put the downloaded file: _jboss-eap-6.2.0.GA-installer.jar_ into _dockers/eap/software_
    
## Building the Apache HTTPD docker container locally
Once you have [installed docker](https://www.docker.io/gettingstarted/#h_installation), downloaded the JBoss EAP 6 software and everything from my github repo, you should be able to create the Apache HTTPD container via the following command:

    $ cd dockers/httpd
	$ docker build -t httpd .

Now let's start the container via the following command:

    $ docker run --hostname="docker.httpd" -P -d -t httpd

Inspect the container and see if it is fully running, via the following command:

    $ docker inspect `docker ps -q -l`

From the command above grab the IP and configure the JBoss EAP 6 docker container.

## Building the JBoss EAP 6 docker container locally
Once you have downloaded the JBoss EAP 6 software and everything from my github repo, adjust the Dockerfile relatively to HTTPD 's IPs, then you should be able to create the JBoss EAP 6 container via the following command:

    $ cd dockers/eap
    $ docker build -t eap .

Now let's start the container via the following command:

    $ docker run --hostname="docker.httpd" -P -d -t eap

Inspect the container and see if it is fully running, via the following command:

    $ docker inspect `docker ps -q -l`

## Experimenting
To spin up a shell in both containers, try the interactive mode:

	$ docker run -P -i -t httpd bash

You can then noodle around the container and run stuff & look at files etc.

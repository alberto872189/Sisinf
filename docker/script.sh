#!/bin/bash

sudo docker stop sisinf-database
sudo docker rm sisinf-database

cd postgres
unzip main.zip

sudo docker build -t sisinf/postgresql:latest .

sudo docker run --name sisinf-database -e ALLOW_EMPTY_PASSWORD=yes -p 5433:5433 -d sisinf/postgresql:latest

cd ..

sudo docker stop sisinf-tomcat
sudo docker rm sisinf-tomcat

cd tomcat
sudo docker build -t sisinf/tomcat:latest .

sudo docker run -d --name sisinf-tomcat -e ALLOW_EMPTY_PASSWORD=yes --link sisinf-database -p 8080:8080 sisinf/tomcat:latest

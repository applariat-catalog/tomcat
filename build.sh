#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid war file exists within the code_dir
# Copies the war file from the code_dir and copies it into /usr/local/tomcat/webapps


rm -rf /usr/local/tomcat/webapps/*

#Check for a war file and throw error if not present
if ls $artifact_root/src/*.war 1> /dev/null 2>&1
then
 echo "found a war file"
 cp -f $artifact_root/src/*.war /usr/local/tomcat/webapps
else
 echo "ERROR! did not find any *.war file"
 exit 1
fi
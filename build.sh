#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid war file exists within the src_dir
# Copies the war file from the src_dir and copies it into /usr/local/tomcat/webapps


#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

#Clean up potential leftovers
rm -rf /usr/local/tomcat/webapps/*

#Check for *.war files and throw error if not present
if ls /src/*.war 1> /dev/null 2>&1
then
 cp -f /src/*.war /usr/local/tomcat/webapps
else
 echo "ERROR! did not find any *.war file"
 exit 1
fi
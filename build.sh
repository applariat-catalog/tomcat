#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid war file exists within the src_dir
# Copies the war file from the src_dir and copies it into /usr/local/tomcat/webapps


#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

#make sure server.xml exists in /conf dir
#stump the default server.xml file with the user provided config
#optionally replace conf/server.xml with your own to customize tomcat
if [ -e /conf/server.xml ]
then
 cp -f /conf/server.xml /usr/local/tomcat/conf/
else
 echo "ERROR! did not find server.xml file in /conf folder"
 exit 1
fi

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
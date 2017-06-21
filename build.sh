#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid war file exists within the src_dir
# Copies the war file from the src_dir and copies it into /usr/local/tomcat/webapps


#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/tomcat-conf/server.xml and use it if exists
#customizing tomcat through providing tomcat-conf/server.xml as part of the code artifact
if [ -e /code/tomcat-conf/server.xml ]
then
 cp -f /code/tomcat-conf/server.xml /usr/local/tomcat/conf/
else
 #look inside /conf for server.xml and use it if exists
 #customizing tomcat through cloning this github repo and providing conf/server.xml
 if [ -e /conf/server.xml ]
 then
  cp -f /conf/server.xml /usr/local/tomcat/conf/
 fi
 #if non of the above, default config file inside the image will be used
fi

#Clean up potential leftovers
rm -rf /usr/local/tomcat/webapps/*

#Check for *.war files and throw error if not present
if ls /code/*.war 1> /dev/null 2>&1
then
 cp -f /code/*.war /usr/local/tomcat/webapps
else
 echo "ERROR! did not find any *.war file"
 exit 1
fi
#!/bin/sh
## Script to email you an alert when the Nexus 6 becomes available again on Google Play
## Tune as needed and add to cron, perhaps as @hourly [scriptpath]  >/dev/null
## Author: Doug Simmons https://google.com/+DougSimmonsIT
## Github: https://github.com/dougsimmons/nexus6status/
  
PLAYURL="https://play.google.com/store/devices/details/Nexus_6_64GB_Midnight_Blue?id=nexus_6_blue_64gb" 
NOINVENTORYTEXT="out of inventory" 
ALERTSUBJECT="Nexus 6 online maybe?!" 
ALERTBODY="Go on Google Play" 
 
MAILFROM="FromAddress@asdf.com" 
ALERTEMAIL="YOU@asdf.com" 
 
CURLPATH=/usr/bin/curl 
MAILXPATH=/usr/bin/mailx 
NOW=$(date +"%T %m-%d") 
 
$CURLPATH --connect-timeout 20 -s $PLAYURL | grep -i "$NOINVENTORYTEXT" 
if [ "$?" -ne "0" ]; 
        then  
                echo "$ALERTBODY \n $PLAYURL \n \n timestamp $NOW" | $MAILXPATH -v -s "$ALERTSUBJECT" -r $MAILFROM $ALERTEMAIL 
fi 

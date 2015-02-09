#!/bin/sh
## Script to email you an alert when the Nexus 6 becomes available again on Google Play
## Tune as needed and add to cron, perhaps as @hourly [scriptpath]  >/dev/null
## Author: Doug Simmons https://google.com/+DougSimmonsIT
## Github: https://github.com/dougsimmons/nexus6status/
## License: Do whatever you want obviously... just don't take my nexus 6! ;)                 
  
PLAYURL="https://play.google.com/store/devices/details/Nexus_6_64GB_Midnight_Blue?id=nexus_6_blue_64gb"
NOINVENTORYTEXT="out of inventory"

ALERTSUBJECT="Nexus 6 online maybe?"
ALERTBODY="Go on Google Play"

MAILFROM="alertaddress@asdf.com"
ALERTEMAIL="YOU@asdf.com"

WGETPATH=/usr/bin/wget
MAILXPATH=/usr/bin/mailx

$WGETPATH $PLAYURL --timeout 30 -O - 2>/dev/null | grep "$NOINVENTORYTEXT" || echo "$ALERTBODY" "$PLAYURL" | $MAILXPATH -v -s "$ALERTSUBJECT" -r $MAILFROM $ALERTEMAIL

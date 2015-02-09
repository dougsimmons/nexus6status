# nexus6status.sh

Get an email alert when the Nexus 6 is finally in stock!

This bash script, the variables of which you need to tweak, emails you an alert when the text "out of inventory" is absent from the Nexus 6's product page on Google Play, indicating that it's possibly available. 

# Usage: 
Change variables as needed, chmod it executable and put it in cron like this:
@hourly /wherever/nexus6status.sh >/dev/null

# Requirements: 
curl, mailx, and (suggested) $800

My first github script, don't judge me. :)

Doug Simmons

#!/bin/bash
# Script to delete weekly *_ActivityTracking sstables

#Variables
#defaultDays=14
days=$1                                                                         #Days sent from command line
week=$(date --date="$days days ago" +"%G_%-V_ActivityTracking")                 #Week for email notifcation and locating proper CF
bodyfile="/tmp/archiveATDrop"

shortsubject="The Number of days is too short"
errsubject="Removing Weeking Activity script failed on $HOSTNAME"
sucesssubject="The removal of $week sstables was successful on $HOSTNAME"
email="root.linux@nativex.com"
errors="/tmp/errors.txt"
sleep=$((10#$(echo $HOSTNAME | grep -o -E ".{2}$")))s


echo -e "Drop Script Started: $(date)\n" > $bodyfile
if [ $days -le 13 ]; then
    echo -e "The number of days $days on the script argument should not be less than 21 Days on $HOSTNAME\n" >> $bodyfile
    /bin/mail -s "$shortsubject" "$email" < $bodyfile
    exit 1;
elif [ $days -ge 14 ]; then
    sleep $sleep
	echo -e "Remove CF folder started: $(date)\n" >> $bodyfile
    rm -rf /var/lib/cassandra/data/Mobile/$week
	retval=$?
	if [ $retval -ne 0 ]; then
		echo -e "An error has occured Removing CF files.\n" >> $bodyfile
        /bin/mail -s "$errsubject" "$email" < $bodyfile
	    exit 1;
	elif [ $retval -eq 0 ]; then
		echo -e "Remove CF Files completed: $(date)\n" >> $bodyfile
        /bin/mail -s "$sucesssubject" "$email" < $bodyfile
	fi;
	
	## Clean up tmp drop script.
    rm -f /tmp/archiveATDrop
fi;
exit 0;

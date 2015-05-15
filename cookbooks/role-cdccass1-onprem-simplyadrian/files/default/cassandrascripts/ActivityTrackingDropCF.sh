#!/bin/bash
# Script to create the new week *_ActivityTracking sstables after the archive location

#Variables
#defaultDays=14
days=$1                                                                         #Days sent from command line
week=$(date --date="$days days ago" +"%G_%-V_ActivityTracking")                 #Week for email notifcation and locating proper CF
bodyfile="/tmp/cassscripts/archiveATDrop"

shortsubject="The Number of days is too short"
errsubject="ActivityTrackingDrop script syntax error on $HOSTNAME"
sucesssubject="The drop of $week was successful"
email="root.linux@simplyadrian.com"
script="/tmp/cassscripts/dropscript.txt"
errors="/tmp/cassscripts/errors.txt"

mkdir -p /tmp/cassscripts
echo -e "Drop Script Started: $(date)\n" > $bodyfile
if [ $days -le 13 ]; then
    echo -e "The number of days $days on the script argument should not be less than 21 Days on $HOSTNAME\n" >> $bodyfile
    /bin/mail -s "$shortsubject" "$email" < $bodyfile
    exit 1;
elif [ $days -ge 14 ]; then
        if [ "$HOSTNAME" == "pchdsl-cass101" ]; then
                # create cassandra-cli script
                echo -e "use Mobile;\n\nDROP COLUMN FAMILY $week;\n" > $script

                ## Execute drop script: -B is batchmode and throws errors.
                echo -e "Drop CF command started: $(date)\n" >> $bodyfile
                cassandra-cli -B -host localhost -port 9160 -f $script >> $bodyfile 2>&1
                retval=$?
                echo -e "Drop CF Command completed: $(date)\n" >> $bodyfile
                if [ $retval -ne 0 ]; then
                        echo -e "An error has occured with dropping the weekly activity tracking script.\n" >> $bodyfile
                        /bin/mail -s "$errsubject" "$email" < $bodyfile
                        exit 1;
                elif [ $retval -eq 0 ]; then
                        echo -e "\nDrop of CF $week Completed Successfully on$(date) \n" >> $bodyfile
            /bin/mail -s "$sucesssubject" "$email" < $bodyfile
                fi

        elif [ "$HOSTNAME" != "pchdsl-cass101" ]; then
                exit 1;
        fi
fi;

## Clean up tmp drop script.
rm -rf /tmp/cassscripts

exit 0;

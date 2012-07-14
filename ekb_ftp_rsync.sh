#!/bin/bash

# creating this on Saturday June 30, 2012
# going to use rsync to backup the FTP in the hope that it will greatly reduce the time it takes to perform a FTP backup.  
# this will look for changes going forward and not download files it already has locally

# Tested this the same day and it seemed to work fine.  It is wicked fast to check for changes.  
# It took 3 hour to backup the 13 GB last night, but less than 10 seconds to check for changes
# This is going to be a huge time saver

# ran it on July 8, 2012 and it detected the changes that were the new screenshots
# uploaded to the training_support_issues

echo "This will back up the entire Drupal files directory.  Choose which sites you want to backup.  This backup is typically done every 2 weeks ";
echo " "
echo "1:  Just the eKB";
echo " ";
echo "2:  Just the Pressflow site";
echo " ";
echo " ";
echo "------------------------------------------";

read -p "Enter your selection: " choice;

echo " "

# echo $choice;

case $choice in 
	1)	echo "You selected choice #1"
		echo " "
		echo "Performing an Rsync on the eKB Files directory ";
		echo " "
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/sites/default/files /home/paul/ecw/ekb/backups/ftp
		echo " "
		sleep 1
		echo " " 
		echo " " ;;
	2)  	echo "You selected choice #2"
		echo " "
		echo "Performing an Rsync on the eKB Files directory ";
		echo " "
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/pressflow/sites/default/files /home/paul/ecw/pressflow/backups/ftp
		echo " "
		sleep 1
		echo "---------------------------------------------------------------------"
		echo " "
		echo "The Pressflow files directory has been backed up via rsync"
		echo " " ;;		
		
esac
echo " " ;


# pressflow stats
# sent 12922 bytes  received 146878 bytes  63920.00 bytes/sec
#  total size is 359617770  speedup is 2250.42  (size of files equal to 343 Mb)
#
# eKB Stats
# sent 31488 bytes  received 386630 bytes  119462.29 bytes/sec
# total size is 13963607585  speedup is 33396.33  (size is equal to 13 GB)
# 
# This script is going to save a lot of time.  Awesome!











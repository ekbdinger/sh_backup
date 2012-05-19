#!/bin/bash

echo "which site would you like to backup?";
echo " "
echo "1:  Just the eKB";
echo " "
echo "2:  Just the Pressflow site";
echo " ";
echo "3:  Both the eKB and the Pressflow sites;"
echo " ";
echo "------------------------------------------";

read -p "Enter your selection: " choice;

echo " "

# echo $choice;

case $choice in 
	1)	echo "You selected choice #1"
		drush @live en -y backup_migrate
		sleep 1
		drush @live bam-backup 
		drush @live dis -y backup_migrate ;;
	2)  	echo "You selected choice #2"
		drush @pf en -y backup_migrate
		sleep 1
		drush @pf bam-backup 
		drush @pf dis -y backup_migrate ;;
	3)  	echo "You selected choice #3"
		drush @live en -y backup_migrate
		sleep 1
		drush @live bam-backup 
		drush @live dis -y backup_migrate
		sleep 1
		echo " "
		echo "--------------------"
		echo "NOW BACKING PF SITE"
		echo "--------------------"
		echo " "
		drush @pf en -y backup_migrate
		sleep 1
		drush @pf bam-backup 
		drush @pf dis -y backup_migrate ;;	
		
		
esac
echo " " ;

# It's weird, it was giving me an error when I was running it as sudo.  
# ok, I almost got this, but I also want to enable both modules
# and disable them
# don't think I need the sleep commands
# can make this look better, but it works!  
# going to put on github







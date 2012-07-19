#!/bin/bash

# created this on June 26, 2012
# This is the file I should use going forward

echo "which site would you like to backup?";
echo " "
echo "1:  Just the eKB";
echo " "
echo "2:  Just the Pressflow site";
echo " ";
echo "3:  Both the eKB and the Pressflow sites (and rsync);"
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
		drush @pf dis -y backup_migrate 
		echo " "
		echo " "
		echo "--------------------"
		echo "NOW BACKING UP d7pf SITE"
		echo "--------------------"
		echo " "
		drush @d7pf en -y backup_migrate
		sleep 1
		drush @d7pf bam-backup 
		drush @d7pf dis -y backup_migrate
		echo " "
		echo " "

#RSYNC starts here
		echo "--------------------"
		echo "RSYNC eKB"
		echo "--------------------"
		echo " "
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/sites/default/files/backup_migrate/manual /home/paul/Desktop/Backups/eKB/bam/
		sleep 1
		echo " "
		echo "--------------------"
		echo "RSYNC Pressflow"
		echo "--------------------"
		echo " "
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/pressflow/sites/default/files/backup_migrate/manual /home/paul/Desktop/Backups/pressflow/bam
		sleep 1
		echo " "
		echo " "
		echo "--------------------"
		echo "RSYNC d7pf site"
		echo "--------------------"
		echo " "
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/d7pf/sites/default/files/private/backup_migrate/manual /home/paul/Desktop/Backups/d7pf/bam
		echo "--------------------"
		echo "Copying all the backup files to the 2nd HD on the Ubuntu Desktop."
		echo "--------------------"
		echo " "
		sudo rsync -azvv /home/paul/Desktop/Backups /media/Backup/eKB/ubuntu_backup
		echo " "
		echo "--------------------"
		echo "You can sleep well.  Both sites are backed up."
		echo "--------------------"
		echo " "

;;	
		
		
esac
echo " " ;

# It's weird, it was giving me an error when I was running it as sudo.  
# ok, I almost got this, but I also want to enable both modules
# and disable them
# don't think I need the sleep commands
# can make this look better, but it works!  
# going to put on github

# so it doesn't work on the backup part.  the drive doesn't show up unless I # go to the backup HD through the file browser first hmm.  
# I"ll have to look into that 06/30/2012
# I bet if I run it again now it will work
# 
# Just ran it again on July 8, 2012.  If I go into it through the file browser # first it will work.  There is probably a way around this though








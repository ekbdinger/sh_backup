#!/bin/bash

# Using rsync to take Drupal Backup and Migrate DB backups
# from the eKB server to my local desktop.
# Initially created this on June 26, 2012
# Used the same template I created for backup.sh and ekb_scp.sh

echo "which site DBs would you like to rsync?";
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

case $choice in
	1)	echo "You selected choice #1"
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/sites/default/files/backup_migrate/manual /home/paul/Desktop/Backups/eKB/bam/
		sleep 1
		echo " "
		echo "*****************************************"
		echo "The eKB's DBs were rsynced to the Ubuntu Desktop" 
		echo "*****************************************"
		echo " ";;
	2)	echo "You selected choice #2"
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/pressflow/sites/default/files/backup_migrate/manual /home/paul/Desktop/Backups/pressflow/bam
		echo " "
		echo "*******************************************************"
		echo "The Pressflow site's DBs were rsynced to the Ubuntu Desktop" 
		echo "*******************************************************" ;;
	3)	echo "You selected choice #3"
		echo " "
		echo "*************************"
		echo "Rsyncing DBs from the eKB"
		echo "**************************"
		echo " "
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/sites/default/files/backup_migrate/manual /home/paul/Desktop/Backups/eKB/bam/
		sleep 1
		echo " "
		echo "***************************"
		echo "Rsyncing DBs from Pressflow"
		echo "***************************"
		echo " "
		rsync -e "ssh -p 18765" -aHzvv root@184.154.31.130:/home/ecwknowl/public_html/pressflow/sites/default/files/backup_migrate/manual /home/paul/Desktop/Backups/pressflow/bam
		sleep 1
		echo " "
		echo "**********************************************************"
		echo " The DBs from both sites have been copied to the desktop"
		echo "**********************************************************"
		echo " " ;;
esac
echo " ";
		


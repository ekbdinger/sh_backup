#!/bin/bash

# created this on June 20, 2012
# automate SQL Dump
# want to figure out how to autopopulate the date for this

# not working for the live kb.  Holding off on this

echo "which site DBs would you like to perform a SQL dump?";
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
		
		sleep 1
		echo " "
		echo "*****************************************"
		echo "The eKB's DBs were copied to the desktop" 
		echo "*****************************************"
		echo " ";;

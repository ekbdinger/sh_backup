#!/bin/bash

# this works as of July 12, 20012
# created 12 accounts for new trainers

# for user in $list
for email in `cat /home/paul/Desktop/drush_user_create/users_example_file`
   do
      	echo "Their email is $email"
      	sleep 1
      	echo ""
      	username=`echo $email | cut -d@ -f1`
	#cut -d@ -f1 $user
	#$newuser = "hello"
	echo "their username is $username"
	echo " "
	echo " "

drush @live ucrt $username --mail=$email 

# omg it has worked up to this point!!!
# it's 1:22 on Thursday July 12, 2012
# Let's see if I can do the rest of it

drush @live ublk $username
drush @live urol "General Role" $username

echo " "
echo "SQL Time"
echo " "
drush @live sqlq "UPDATE users SET DATA = (select data2 from dummytable) WHERE name = '$username'"

drush @live uublk $username

echo " "
echo " "
echo " users created"
					
		
done

#!/bin/bash

echo " ";
echo "USER CREATION UTILITY";
echo " "
echo " ";
echo "------------------------------------------";

read -p "Enter a username: " name;

# for debugging purposes
# echo "You entered: $name "

echo " ";
echo " ";
read -p "Please enter a password:  " pass;
echo " ";
echo " ";
echo "You entered: $pass";

echo " ";
echo " ";
read -p "Please enter an email :  " email;
echo " ";
echo " ";
echo "You entered: $email";

echo " ";
echo " ";
echo "Now let's do some drush magic";
echo "------------------------------------------";
echo " ";
echo " ";
cd /var/www/pressflow;
drush ucrt $name --mail=$email --password=$pass;




echo " ";
echo "El Fin!";

# Ok this works up to this point
# I will need to add the following
# 		--add the user role
#		--block/unblock user to generate the email
#		--Add the Tac_lite SQL
#
#	UPDATE users SET DATA = (select data2 from dummytable) WHERE name = "test"
# I can use the SQL commands in Drush to do this.  Pretty awesome
# I"m falling asleep at the computer now, so I think it's bed time


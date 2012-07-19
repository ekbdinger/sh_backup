loop_list.sh

#!/bin/bash

list="test@email.com test1@email.com test2@email.com"

for user in $list
   do
      echo "This user is $user"
      sleep 1
      echo ""
		
done

#!/bin/bash

read -p "Enter your number: " f
read -p "Enter: " m n

if [ $n -ge 1 ] && [ $n -le 7 ]
then
        let "d = 14 - $n"
        #echo $d
        date=$(date --date="$d days ago" "+%y-%m-%d")
        echo "attendance record of $f on  $date"
      

        d=$(cat attendance | grep "^+$date" | grep "$f"| cut -d " " -f 2,3 | column -t)
        echo -e "$d\n"
else
        echo wrong input!
fi

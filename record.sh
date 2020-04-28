#!/bin/bash

read -p "enter your number: " number
read -p "enter: " day
if [ $day -ge 1 ] && [ $day -le 7 ]


then
        let "week_day = 14 - $day"
        x=$(date --date = "$week_day days ago" "+%Y-%m-%d")
        echo "attendance for $number on $x"
      
        final  =  $(cat attendance | grep "^+$x" | grep "$number"| cut -d " " -f 2,3 | column -t)
        echo -e "$final\n"
else
        echo Wrong inout!
fi




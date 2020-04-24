#!/bin/bash

wget -O attendance https://inductions.delta.nitt.edu/sysad-task1-attendance.log                             #fetching attendance file from given url


sudo touch /home/armygen/attd_record                                               #creating attd_record in armygen folder

sudo touch /home/navymarshall/attd_record                                          #creating attd_record in naymarshall folder

sudo touch /home/airforcechief/attd_record                                         #creating attd_record in airforce folder

date=$(date "+%y-%m-%d")





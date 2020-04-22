#!/bin/bash


sudo useradd chiefcommander -m -s /bin/bash 
sudo useradd armygen -m -s /bin/bash 
sudo useradd navymarshall -m -s /bin/bash 
sudo useradd airforcechief -m -s /bin/bash 

for  i in {1..50}
do
        sudo useradd army$i -m -s /bin/bash
        sudo useradd navy$i -m -s /bin/bash
        sudo useradd airforce$i -m -s /bin/bash
done


for i in {1..50}
do 
        sudo setfacl -m u:armygen:rwx -R /home/army$i
        sudo setfacl -m u:navymarshall:rwx -R /home/navy$i
        sudo setfacl -m u:airforcechief:rwx -R /home/airforce$i
done


sudo setfacl -m u:chiefcommander:rwx -R /home/armygen
sudo setfacl -m u:chiefcommander:rwx -R /home/navymarshall
sudo setfacl -m u:chiefcommander:rwx -R /home/airforcechief
for j in {1..50}
do
        sudo setfacl -m u:chiefcommander:rwx -R /home/army$j
        sudo setfacl -m u:chiefcommander:rwx -R /home/navy$j
        sudo setfacl -m u:chiefcommander:rwx -R /home/airforce$j
done

for k in {1..50}
do
        sudo chmod o-rx /home/army$k
        sudo chmod o-rx /home/navy$k
        sudo chmod o-rx /home/airforce$k
done


downloading log file
wget -O position https://inductions.delta.nitt.edu/sysad-task1-position.log


match=$(date "+%y-%m-%d")


for i in {1..50}
do
    sudo touch /home/army$i/post_alloted
    sudo cat position | grep -w "army$i" | grep -w "^+$match" | cut -d " " -f 1,4,5 > /home/army$i/post_alloted
    
    sudo touch /home/navy$i/post_alloted
    sudo cat position | grep -w "navy$i" | grep -w "^+$match" | cut -d " " -f 1,4,5 > /home/navy$i/post_alloted
    
    sudo touch /home/airforce$i/post_alloted
    sudo cat position | grep -w "airforce$i" | grep -w "^+$match" | cut -d " " -f 1,4,5 > /home/airforce$i/post_alloted
done


wget -O attendance https://inductions.delta.nitt.edu/sysad-task1-attendance.log


sudo touch /home/armygen/attd_record
sudo touch /home/navymarshall/attd_record
sudo touch /home/airforcechief/attd_record

match=$(date "+%y-%m-%d")



read -p "Enter your fleet: " f
read -p "Enter: " m n

if [ $n -ge 1 ] && [ $n -le 7 ]
then
        let "d = 14 - $n"
        #echo $d
        match=$(date --date="$d days ago" "+%y-%m-%d")
        echo "attendance record of $f on  $match"
      

        d=$(cat attendance | grep "^+$match" | grep "$f"| cut -d " " -f 2,3 | column -t)
        echo -e "$d\n"
else
        echo wrong input!
fi



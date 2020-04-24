#!/bin/bash


sudo useradd chiefcommander -m -s /bin/bash 
sudo useradd armygen -m -s /bin/bash 
sudo useradd navymarshall -m -s /bin/bash 
sudo useradd airforcechief -m -s /bin/bash 

for  i in {1..50}
do
        sudo useradd army$i -m -s /bin/bash
       
done

for  i in {1..50}
do
        sudo useradd navy$i -m -s /bin/bash

done
for  i in {1..50}
do
       
        sudo useradd airforce$i -m -s /bin/bash
done

echo "users created successfully!"


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



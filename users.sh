#!/bin/bash

#creating users chief commander,armygen,navymarshall,airforcechief
sudo useradd chiefcommander -m -s /bin/bash 
sudo useradd armygen -m -s /bin/bash 
sudo useradd navymarshall -m -s /bin/bash 
sudo useradd airforcechief -m -s /bin/bash 



#creating 50 soldiers in all fields..

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

#!/bin/bash


#to download the given position log file..



wget -O posit https://inductions.delta.nitt.edu/sysad-task1-position.log


date=$(date "+%y-%m-%d")                      #(reqd date)


for i in {1..50}
do
    sudo touch /home/army$i/post_alloted
   
   
    sudo cat posit | grep -w "army$i" | grep -w "^+$date" | cut -d " " -f 1,4,5 > /home/army$i/post_alloted                              #using grep for finding particular patterns
    
    
    sudo touch /home/navy$i/post_alloted



    sudo cat posit | grep -w "navy$i" | grep -w "^+$date" | cut -d " " -f 1,4,5 > /home/navy$i/post_alloted                              #using grep for finding particular patterns


    
    sudo touch /home/airforce$i/post_alloted

   
    sudo cat posit | grep -w "airforce$i" | grep -w "^+$date" | cut -d " " -f 1,4,5 > /home/airforce$i/post_alloted                      #using grep for finding particular patterns

    
done



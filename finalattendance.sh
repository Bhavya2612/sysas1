#!/bin/bash

touch /home/chiefcommander/attd_report

for number in army navy airforce
do
        echo $number >> /home/chiefcommander/attd_report
        cat attendance | grep $number | column -t >> /home/chiefcommander/attd_report
done


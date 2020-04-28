#!/bin/bash

touch /home/chiefcommander/final10

diff attendance position | grep YES > sort1

u=$(awk '{print $1, $2,$7,$8}' sort1 | sed 's/N°//' | sed 's/E°//') 
echo -e "$u" > sort2


awk '{print $1,$2,((($3 - 28.7041) ^ 2) + (($4 - 77.1025) ^ 2)) }' sort2  > sort3
cat sort3 |sort -k3 -n | column -t | head > /home/chiefcommander/final10
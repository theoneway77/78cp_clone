#!/bin/bash

dcfldd if=~/78cp_clone/source.txt 2>>err.txt | tee >(dd of=~/78cp_clone/un.txt 2>>err.txt) >(dd of=~/78cp_clone/deux.txt 2>>err.txt ) >(dd of=~/78cp_clone/trois.txt 2>>err.txt) >(dd of=~/78cp_clone/quatre.txt 2>>err.txt) | dd of=~/78cp_clone/cinque.txt 2>>err.txt


##compare source file to the french duplicates using  sha256sums for source.txt, un.txt, deux.txt, trois.txt, quatre.txt, and cinque.txt. 
#set `sha256sum -b source.txt un.txt deux.txt trois.txt quatre.txt cinque.txt`
#echo $1 
#echo $3
#echo $5
#echo $7
#echo $9
#echo ${11}
#sleep 6

#  if [ $1 = $3 -a $3 = $5 -a $5 = $7 -a $7 = $9 -a $9 = ${11} ]
#	then echo "Duplication Successful"
#	else echo "There was an error while copying."
 # fi

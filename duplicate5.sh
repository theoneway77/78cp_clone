#!/bin/bash

#copy source to -n destinations
dcfldd if=~/78cp_clone/source.txt 2>>err.txt | tee >(dd of=~/78cp_clone/un.txt 2>>err.txt) >(dd of=~/78cp_clone/deux.txt 2>>err.txt ) >(dd of=~/78cp_clone/trois.txt 2>>err.txt) >(dd of=~/78cp_clone/quatre.txt 2>>err.txt) | dd of=~/78cp_clone/cinque.txt 2>>err.txt

#Assign positional parameter variables to all words in any line with the word `copied` in it from the file err.txt.  
set `grep -iw "copied" err.txt`
#If the first word in the line (which is the number of bytes copied) is the same in all -n lines, then the duplication was successful.  
#Otherwise it may not have been.  
if [ $1 -eq ${10} -a ${10} = ${19} -a ${19} = ${28} -a ${28} = ${37} ]
then 
	echo "Duplication Great Success!"
else
	echo "there may have been a problem with the transfer. Please check your media."
fi
#cut and paste the contents of err.txt into errlog.txt.  This will give us a fresh err.txt to evaluate for the next iteration. 
cat err.txt >> errlog.txt
rm err.txt


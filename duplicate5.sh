#!/bin/bash

#copy source to -n destinations and redirect error to err.txt
dcfldd if=~/78cp_clone/source.txt 2>>err.txt | tee >(dd of=~/78cp_clone/un.txt 2>>err.txt) >(dd of=~/78cp_clone/deux.txt 2>>err.txt ) >(dd of=~/78cp_clone/trois.txt 2>>err.txt) >(dd of=~/78cp_clone/quatre.txt 2>>err.txt) | dd of=~/78cp_clone/cinque.txt 2>>err.txt

#2 carriage returns for errlog.txt to manke it more readable. 
echo -e "\r\r" >> errlog.txt

#Append the date and time to errlog.txt
date >> errlog.txt 

#Assign positional parameter variables to all words in any line with the word `copied` in it from the file err.txt.  
set `grep -iw "copied" err.txt`

#Check if $1 is a number. If so, then check if all file tranfer sizes are the same.  
if [[ $1 != [0-9]* ]]
  then
  echo "variable 1 is not a number!"
  else
	if [ $1 -eq ${10} -a ${10} = ${19} -a ${19} = ${28} -a ${28} = ${37} ]
	then 
		echo "Duplication Great Success!"
	else
		echo "there may have been a problem with the transfer. Please check your media."
	fi
fi

#Paste the contents of err.txt into errlog.txt. 
cat err.txt >> errlog.txt

#2 carriage returns for errlog.txt to manke it more readable. 
echo -e "\r\r" >> errlog.txt

#delete err.txt This wnill give us a fresh err.txt to evaluate for the next iteration. 
rm err.txt


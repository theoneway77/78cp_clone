#!/bin/bash
dcfldd if=~/78cp_clone/source.txt | tee >(dd of=~/78cp_clone/un.txt) >(dd of=~/78cp_clone/deux.txt) >(dd of=~/78cp_clone/trois.txt) >(dd of=~/78cp_clone/quatre.txt) | dd of=~/78cp_clone/cinque.txt
#compare source file to the french duplicates using  sha256sums for source.txt, un.txt, deux.txt, trois.txt, quatre.txt, and cinque.txt. 
set `sha256sum -b source.txt un.txt deux.txt trois.txt quatre.txt cinque.txt`
echo $1 
echo $3
echo $9
sleep 6

  if [ $1 = $3 -a $3 = $5 -a $5 = $7 -a $7 = $9 ]
	then echo "Duplication Successful"
	else echo "There was an error while copying."
  fi

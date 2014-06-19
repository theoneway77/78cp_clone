#!/bin/bash
sudo dcfldd if=/dev/sda | tee >(dd of=/dev/sdb) | dd of=/dev/sdb
#compare source file to the outputs
set `sha256sum -b /dev/sda /dev/sdb /dev/sdc`
echo $1 
echo $3
echo $5
#echo $7
#echo $9
#echo ${11}
sleep 2

  if [ $1 = $3 -a $3 = $5 ]
	then echo "Duplication Successful"
	else echo "There was an error while copying."
  fi

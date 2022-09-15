#!/bin/bash

for i in `cat servery.txt`
do
	echo "ssh root@$i 'echo \"root:$(apg -n 1)\" | chpasswd'"
done

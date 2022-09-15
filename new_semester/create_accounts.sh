#!/bin/bash

skupina="os";
rok="2022"
cislo_skupiny="2900";

loginy="loginy_$skupina$rok.txt";
jmena="lidi_$skupina$rok.txt";
cislo="1"
echo -n "" > passwd
echo -n "" > shadow

for i in `cat $loginy`
do
	uid=`expr $cislo_skupiny + $cislo`;
	jmeno=`cat $jmena | head -$cislo | tail -1`;
	echo "$i:x:$uid:$cislo_skupiny:$jmeno,,,:/home/$skupina/$i:/bin/bash" >> passwd
	echo "$i::17217:0:99999:7:::" >> shadow 
	echo "mkdir /home/$skupina/$i";
#	echo "mkdir /home/$skupina/$i/public_html/"; #jen pro ty, co maji
	echo "chown -R $i /home/$skupina/$i";
	echo "chgrp -R $skupina /home/$skupina/$i";
	let cislo++;
done

echo ;
echo -n "$skupina:x:$cislo_skupiny:"
for i in `cat $loginy`
do
	echo -n "$i,"
done

echo ; echo ;

for i in `cat $loginy`
do
	#echo "echo $skupina | passwd --stdin $i"
	echo "echo \"$i:$skupina\" | chpasswd"
done
echo;

for i in `cat $loginy`
do
	#echo "cp /home/jana/.bash_profile /home/jana/.bashrc /home/$skupina/$i/"
	echo "cp /home/jana/.bashrc /home/$skupina/$i/"
	echo "chown $i /home/$skupina/$i/.bash*"
	echo "chgrp $skupina /home/$skupina/$i/.bash*"
done
echo;

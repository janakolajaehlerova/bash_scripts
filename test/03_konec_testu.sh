#!/bin/bash

skupina=`cat ./lidi | grep skupina | cut -d"=" -f2` ;
echo "***konec testu pro grupu: $skupina ***"

chmod 640  odpovedi/*.bonusova.odpoved.txt ;

echo 
# prvni dve otazky
lidi=`cat ./lidi | grep lidi | cut -d"=" -f2 | tr "," " "`
for clovek in $lidi
do
        houm="/home/$skupina/$clovek"
	ls -la $houm/test01/adr/ > odpovedi/$clovek.12.odpoved.txt ;
	cp $houm/test01/adr/3.odpoved.txt odpovedi/$clovek.3.odpoved.txt ;
done
chown jana odpovedi/*.12.odpoved.txt odpovedi/*.3.odpoved.txt ;
chgrp $skupina odpovedi/*.12.odpoved.txt odpovedi/*.3.odpoved.txt ;

ps aux > odpovedi/3.odpoved.txt ;
echo "\n \n a nyni! \n \n" >> odpovedi/3.odpoved.txt ;
ps -eo ruser=,uid=,comm= | grep tail >> odpovedi/3.odpovedB.txt ;
ps -eo ruser=,uid=,comm= | grep head >> odpovedi/3.odpovedA.txt ;
ps -eo ruser=,uid=,comm= | grep sleep >> odpovedi/3.odpovedsleep.txt ;
chown jana odpovedi/3.odpoved*.txt ;
chgrp $skupina odpovedi/3.odpoved*.txt ;


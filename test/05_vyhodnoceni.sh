#!/bin/bash

echo "***vyhodnocuju***"
skupina=`cat ./lidi | grep skupina | cut -d"=" -f2`
lidi=`cat ./lidi | grep lidi | cut -d"=" -f2 | tr "," " "`
for clovek in $lidi
do
	o1=0
	o2=0
	o3=0
	varianta=`grep $clovek lidilog | cut -d\  -f2`

	#vyhodnocuju 1. a 2. otazku
	if [ -e "odpovedi/$clovek.12.odpoved.txt" ]; then
		cat 1.odpoved$varianta.txt ;
		cat odpovedi/$clovek.12.odpoved.txt ;
		tail +4 1.odpoved$varianta.txt | tr -s " " | cut -d\  -f1,2,4,9 > tmp1 ;
		tail +4 odpovedi/$clovek.12.odpoved.txt | tr -s " " | cut -d\  -f1,2,4,9 > tmp2 ;
		if diff tmp1 tmp2; then
			echo "jsou stejne\n o1=100 o2=100 ?"
			read odpoved;
			if [ -z $odpoved ]; then
				o1=100
				o2=100
				echo "davam plny pocet za 1. i 2."
			else				
				o1=`echo $odpoved | cut -d" " -f1`
				o2=`echo $odpoved | cut -d" " -f2`
				echo "davam 1. otazky $o1 a 2. otazky $o2" ;
			fi
		else
			echo "kolik das bodu?"                       
			read odpoved;
                        o1=`echo $odpoved | cut -d" " -f1`
                        o2=`echo $odpoved | cut -d" " -f2`
                        echo "davam 1. otazky $o1 a 2. otazky $o2" ;
		fi
	else
		echo "neni odpoved 12" ;
	fi
	if [ -e "odpovedi/$clovek.3.odpoved.txt" ]; then
		echo "spusten skript a sleep" ;
		o3=$((o3+33)) ;
		uid=`grep $clovek /etc/passwd | cut -d: -f3`
		if grep $uid odpovedi/3.odpovedsleep.txt ; then
	                echo "nezabil sleep";
        	else
                	echo "zabil sleep";
	                o3=$((o3+33)) ;
        	fi
	else
		echo "nespustil skript, nemuze zabijet sleep"
	fi

	if [ "$varianta" == "A" ] || [ "$varianta" == "C" ]; then 
		varianta3=A ; 
	else # B nebo D
		varianta3=B ;	
	fi
        if grep $uid odpovedi/3.odpoved$varianta3.txt ; then 
                echo "ma spusteny head nebo tail";
		o3=$((o3+34)) ;
        else 
                echo "nema spusteny head nebo tail"; 
        fi
	echo "davam 3. otazce $o3 bodu ?" ;
        read odpoved ;
        if [ -n "$odpoved" ]; then
	        o3=$odpoved ;
	fi

	if [ -e odpovedi/$clovek.bonusova.odpoved.txt ]; then
		cat odpovedi/$clovek.bonusova.odpoved.txt
		echo "kolik davas ?" ;
        	read bonus ;
	else
		bonus="x";
	fi

	o=$(( (o1+o2+o3)/3 )) ;

	printf "o1 %s\to2 %s\to3 %s\tbonus %s\t%s\t%s\n" $o1 $o2 $o3 $bonus $clovek $o
	printf "%s\t%s\t%s\t%s\t%s\t%s\n" $o1 $o2 $o3 $bonus $clovek $o >> vysledky.txt
done
cp vysledky.txt /home/jana/zalohy/odpovedi`pwd | cut -d"_" -f2,3`


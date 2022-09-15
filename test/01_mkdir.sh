#!/bin/bash
skupina=`cat ./lidi | grep skupina | cut -d"=" -f2`
echo "***vytvarim skript pro grupu: $skupina ***"

echo "***menim prava otazek***"
#otazky a jejich prava
chown jana ./*.otazka*.txt;
chgrp $skupina ./*.otazka*.txt;
chmod 600 ./*.otazka*.txt;

echo "***vytvarim adresar odpovedi***"
#vytvoreni adresaru pro odpovedi u jany
mkdir odpovedi ;
chown jana odpovedi ;
chgrp $skupina odpovedi ;
chmod 711 odpovedi ;

echo "***jdu po jednotlivych lidech a vytvarim test01***"
lidi=`cat ./lidi | grep lidi | cut -d"=" -f2 | tr "," " "`
for clovek in $lidi
do
	touch odpovedi/$clovek.bonusova.odpoved.txt ;
	chmod 666 odpovedi/$clovek.bonusova.odpoved.txt ;
	#vytvoreni adresaru u studentu a nalinkovani otazek a odpovedi
	houm="/home/$skupina/$clovek"	
	mkdir $houm/test01 ;
        chown -R $clovek $houm/test01/ ;
        chgrp -R $skupina $houm/test01/ ;	
	nahodne_cislo=`expr $RANDOM % 4` ;
	if [ "$nahodne_cislo" == 0 ]; then
		ln -f 1.otazkaA.txt $houm/test01/1.otazka.txt ;
		ln -f 2.otazkaA.txt $houm/test01/2.otazka.txt ;
		ln -f 3.otazkaA.txt $houm/test01/3.otazka.txt ;
		echo "$clovek A" >> lidilog
	fi
        if [ "$nahodne_cislo" == 1 ]; then
                ln -f 1.otazkaB.txt $houm/test01/1.otazka.txt ;
                ln -f 2.otazkaB.txt $houm/test01/2.otazka.txt ;
                ln -f 3.otazkaB.txt $houm/test01/3.otazka.txt ;
                echo "$clovek B" >> lidilog
        fi
        if [ "$nahodne_cislo" == 2 ]; then
                ln -f 1.otazkaC.txt $houm/test01/1.otazka.txt ;
                ln -f 2.otazkaC.txt $houm/test01/2.otazka.txt ;
                ln -f 3.otazkaA.txt $houm/test01/3.otazka.txt ;
                echo "$clovek C" >> lidilog
        fi
        if [ "$nahodne_cislo" == 3 ]; then
                ln -f 1.otazkaD.txt $houm/test01/1.otazka.txt ;
                ln -f 2.otazkaD.txt $houm/test01/2.otazka.txt ;
                ln -f 3.otazkaB.txt $houm/test01/3.otazka.txt ;
                echo "$clovek D" >> lidilog
        fi
	ln -f skript_na_spusteni.sh $houm/test01/skript_na_spusteni.sh ;
	ln -f bonusova.otazka.txt $houm/test01/bonusova.otazka.txt ;
	ln -fs `pwd`/odpovedi/$clovek.bonusova.odpoved.txt $houm/test01/bonusova.odpoved.txt ;
        #zmena prav a vlastniku pro symbolicke linky odpovedi u studentu
        chown -h $clovek $houm/test01/*.odpoved.txt ;
	chgrp -h $skupina $houm/test01/bonusova.odpoved.txt ;
	#vytvoreni adresare adr u jany v testovani a nalinkovani ke studentum v 'test'u
        mkdir $houm/test01/adr ;
        chown -R $clovek $houm/test01/adr ;
        chgrp -R $skupina $houm/test01/adr ;
	chmod 700 $houm/test01/adr ;
done

chown jana odpovedi/*.bonusova.odpoved.txt ;
chgrp $skupina odpovedi/*.bonusova.odpoved.txt ;
chmod 666 odpovedi/*.bonusova.odpoved.txt ;

exit 0

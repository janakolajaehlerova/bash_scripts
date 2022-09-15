#!/bin/bash
skupina=`cat ./lidi | grep skupina | cut -d"=" -f2`
echo "***mazu home pro grupu $skupina a adresar odpovedi***"
rm -rf /home/$skupina/*/test01
rm -rf ./odpovedi
echo "***mazu lidilog***"
echo -n "" > lidilog
echo "***mazu vysledky***"
echo -n "" > vysledky.txt

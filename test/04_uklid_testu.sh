#!/bin/bash
# promazani prazdnych file

echo "***promazavam prazdne odpovedi***"
for file in odpovedi/* ;
  do
    file_size=$(du $file | awk '{print $1}');
    if [ $file_size == 0 ]; then
        echo "Deleting 0 file $file";
        rm -f $file;
    fi;
  done

for file in odpovedi/*.12.odpoved.txt;
  do
    file_length=$(cat $file | wc -l);
    if [ $file_length == 3 ]; then
        echo "Deleting 3 file $file";
        rm -f $file;
    fi;
  done
  
echo "***zabijim procesy***"
killall -9 tail ;
killall -9 head ;

echo "***kopiruju do odpovedi`pwd | cut -d"_" -f2,3`***"
cp -r odpovedi /home/jana/zalohy/odpovedi`pwd | cut -d"_" -f2,3`
cp lidilog /home/jana/zalohy/odpovedi`pwd | cut -d"_" -f2,3`
chown -R jana /home/jana/zalohy/odpovedi`pwd | cut -d"_" -f2,3`
chgrp -R vyucujici /home/jana/zalohy/odpovedi`pwd | cut -d"_" -f2,3`



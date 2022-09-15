#!/bin/bash

i=0
for server in $(cat servery.txt) #| grep uxi)
do
	let i++
	heslo=$(grep "@$server" hesla.txt | cut -d: -f2-3 | cut -d\" -f1)
	student=$(head -$i studenti.txt | tail -1)
	echo -e "$student \nVas server se jmenuje $server \na rootovske heslo je $heslo\nVice informaci na elearning.tul.cz.\nS pozdravem,\nJana Kolaja Ehlerova\n"
done

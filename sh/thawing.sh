#!/bin/sh

dirpath=$(pwd)

ls -1 | grep "\.rar" | while read line
do 
	echo "###decompress " $line "###"
	line_noextension=${line%.*}
	mkdir "$dirpath/$line_noextension/"
	unrar x "$line" -d "$dirpath/$line_noextension"
done

ls -1 | grep "\.zip" | while read line
do 
	echo "###decompress " $line "###"
	line_noextension=${line%.*}
	#mkdir "$dirpath/$line_noextension/"
	#unzip "$line" -d "$dirpath/$line_noextension"
	unar "$line" 
done
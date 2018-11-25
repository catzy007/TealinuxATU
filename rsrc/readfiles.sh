#!/bin/bash
echo "read files : "
readarray apps < listapps.cfg

for index in ${!apps[@]}; do
	#echo "${apps[$index]}"
	if [ $(dpkg-query -W -f='${Status}' ${apps[$index]} 2>/dev/null | grep -c "ok installed") -eq 0 ]
	then
		echo ${apps[$index]} is not installed!
	fi
done


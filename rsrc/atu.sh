#!/bin/bash
arg="$1"
echo "Welcome to TealinuOS Automatic Testing Utility"
case $arg in
	-t1|--test1)
		echo "Test 1 - Check installed apps"
		if [ ! -f listapps.cfg ]
		then
			echo "listapps.cfg not found!"
		else
			rslt=0
			echo "List of apps"
			readarray apps < listapps.cfg
			for index in ${!apps[@]}; do
				echo " "${index} ${apps[$index]}
			done
			for index in ${!apps[@]}; do
				#echo "${apps[$index]}" 
				if [ $(dpkg-query -W -f='${Status}' ${apps[$index]} 2>/dev/null | grep -c "ok installed") -eq 0 ]
				then
					rslt=$((rslt+1))
					echo ${apps[$index]} is not installed!
				fi
			done
			if (( ${rslt} > 0 ))
			then
				echo Test completed with ${rslt} apps not installed!
			else
				echo Test completed with all apps installed!
			fi
		fi
	;;
	-t2|--test2)
		echo "Test 2 - Check if installed apps working correctly"
		echo "development in progress!"
	;;
	-t3|--test3)
		echo "Test 2 - Check if default apps is set correctly"
		echo "development in progress!"
	;;
	*)
		echo "Usage: ATU.sh [ARGUMENT]"
		echo "Argument:"
		echo "-t1"
		echo "  begin test 1"
		echo "  check installed apps"
		echo "-t2"
		echo "  begin test 2"
		echo "  check if installed apps working correctly"
		echo "-t3"
		echo "  begin test 3"
		echo "  check if default apps is set correctly"
	;;
esac

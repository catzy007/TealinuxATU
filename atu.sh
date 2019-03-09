#!/bin/bash

arg="$1"
file1="listappsT1.cfg"
file2="listappsT2.cfg"
file3="listappsT3.cfg"
echo "Welcome to TealinuxOS Automatic Testing Utility"
echo
echo "Hardware Information : "
inxi -Fx -c 00
echo
case $arg in
	-t1|--test1)
		echo "Test 1 - Check installed apps"
		if [ ! -f ${file1} ]
		then
			echo ${file1} not found!
		else
			rslt=0
			echo "List of apps"
			readarray apps < ${file1}
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
			echo
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
		echo "Test 3 - Check if default apps is set correctly"
		#echo "development in progress!"
		if [ ! -f ${file3} ]
		then
			echo ${file3} not found!
		else
            rslt3=0
			echo "List of apps"
			readarray apps < ${file3}
			for index in ${!apps[@]}; do
				echo " "${index} ${apps[$index]}
			done
			for index in ${!apps[@]}; do
				#echo "${apps[$index]}"
				if [ $(cat /usr/share/applications/defaults.list | grep  ${apps[$index]} > /dev/null; echo $?) -eq 1 ]
				then
					rslt3=$((rslt3+1))
					echo ${apps[$index]} is not the default apps!
				fi
			done
			echo
			if (( ${rslt3} > 0 ))
			then
				echo Test completed with ${rslt3} apps not being defaults!
			else
				echo Test completed with all apps being defaults!
			fi
		fi
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

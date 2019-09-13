#!/bin/bash

link1="https://raw.githubusercontent.com/catzy007/TealinuxATU/master/listappsT1.cfg"
link2="https://raw.githubusercontent.com/catzy007/TealinuxATU/master/listappsT2.cfg"
link3="https://raw.githubusercontent.com/catzy007/TealinuxATU/master/listappsT3.cfg"

file1="/usr/share/tealinux/TealinuxATU/listappsT1.cfg"
file2="/usr/share/tealinux/TealinuxATU/listappsT2.cfg"
file3="/usr/share/tealinux/TealinuxATU/listappsT3.cfg"

arg="$1"
echo "Welcome to TealinuxOS Automatic Testing Utility"
echo
echo "Hardware Information : "
inxi -Fxm -c 00
echo
case $arg in
	-t1|--test1)
		rm -f $file1
		wget -qN $link1 -O $file1
		echo "Test 1 - Check installed apps"
		if [ ! -f ${file1} ]; then
			echo "${file1} not found!"
		else
			rslt=0
			echo "List of apps"
			readarray -t apps < ${file1}
			for index in ${!apps[@]}; do
				if [ $(echo "${apps[$index]}" | grep \# | wc -l) == 0 ]; then
					echo " ${index} ${apps[$index]}"
				fi
			done
			echo

			for index in ${!apps[@]}; do
				if [ $(echo "${apps[$index]}" | grep \# | wc -l) == 0 ]; then
					#echo "${apps[$index]}"
					if [ $(echo "${apps[$index]}" | grep \  | wc -l) == 0 ]; then
						#echo "not contain space" #debug_line_can_be_removed
						search1=$(printf 'name=%s' "${apps[$index]}")
						search2=$(printf '%s: /' "${apps[$index]}")

						if [ $(dpkg-query -W -f='${Status}' "${apps[$index]}" 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
							if [ $(grep -i "$search1" /usr/share/applications/*.desktop > /dev/null; echo $?) -eq 1 ]; then
								if [ $(whereis "${apps[$index]}" | grep -i "$search2" > /dev/null; echo $?) -eq 1 ]; then
									rslt=$((rslt+1))
									echo "${apps[$index]} is not installed!"
								fi
							fi
						fi
					else
						#echo "contain space" #debug_line_can_be_removed
						search=$(printf 'name=%s' "${apps[$index]}")
						if [ $(grep -i "$search" /usr/share/applications/*.desktop > /dev/null; echo $?) -eq 1 ]; then
							rslt=$((rslt+1))
							echo "${apps[$index]} is not installed!"
						fi
					fi
				fi
			done
			echo

			if (( ${rslt} > 0 ))
			then
				echo "Test completed with ${rslt} apps not installed!"
			else
				echo "Test completed with all apps installed!"
			fi
		fi
	;;
	-t2|--test2)
		rm -f $file2
		wget -qN $link2 -O $file2
		echo "Test 2 - Check removed apps"
		if [ ! -f ${file2} ]; then
			echo "${file2} not found!"
		else
			rslt=0
			echo "List of apps"
			readarray -t apps < ${file2}
			for index in ${!apps[@]}; do
				if [ $(echo "${apps[$index]}" | grep \# | wc -l) == 0 ]; then
					echo " ${index} ${apps[$index]}"
				fi
			done
			echo

			for index in ${!apps[@]}; do
				if [ $(echo "${apps[$index]}" | grep \# | wc -l) == 0 ]; then
					if [ $(echo "${apps[$index]}" | grep \  | wc -l) == 0 ]; then
						#echo "not contain space" #debug_line_can_be_removed
						search1=$(printf 'name=%s' "${apps[$index]}")
						#echo $search1 #debug_line_can_be_removed

						if [ $(dpkg-query -W -f='${Status}' "${apps[$index]}" 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
							if [ $(grep -i "$search1" /usr/share/applications/*.desktop > /dev/null; echo $?) -eq 0 ]; then
								rslt=$((rslt+1))
								echo "${apps[$index]} need to be removed!"
							fi
						fi
					else
						#echo "contain space"
						search=$(printf 'name=%s' "${apps[$index]}")
						if [ $(grep -i "$search" /usr/share/applications/*.desktop > /dev/null; echo $?) -eq 0 ]; then
							rslt=$((rslt+1))
							echo "${apps[$index]} need to be removed!"
						fi
					fi
				fi
			done
			echo

			if (( ${rslt} > 0 )); then
				echo "Test completed with ${rslt} apps need to be removed!"
			else
				echo "Test completed with no apps need to be removed!"
			fi
		fi
	;;
	-t3|--test3)
		rm -f $file3
		wget -qN $link3 -O $file3
		echo "Test 3 - Check if default file types is set correctly"
		if [ ! -f ${file3} ]
		then
			echo "${file3} not found!"
		else
			rslt3=0
			echo "List of file types"
			readarray -t apps < ${file3}
			for index in ${!apps[@]}; do
				if [ $(echo "${apps[$index]}" | grep \# | wc -l) == 0 ]; then
					echo " ${index} ${apps[$index]}"
				fi
			done
			echo

			for index in ${!apps[@]}; do
				if [ $(echo "${apps[$index]}" | grep \# | wc -l) == 0 ]; then
					#echo "${apps[$index]}"
					if [ $(grep -i "${apps[$index]}" /usr/share/applications/defaults.list > /dev/null; echo $?) -eq 1 ]
					then
						rslt3=$((rslt3+1))
						echo "No default apps set for ${apps[$index]}!"
					fi
				fi
			done

			echo
			if (( ${rslt3} > 0 ))
			then
				echo "Test completed with ${rslt3} file types not set!"
			else
				echo "Test completed with all file types set!"
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
		echo "  check removed apps"
		echo "-t3"
		echo "  begin test 3"
		echo "  check if default apps is set correctly"
	;;
esac
echo
echo "If you found an error or bug"
echo "Make a report to : https://docs.google.com/forms/d/e/1FAIpQLSc8xqnsk3nbPY8UzCaO7e4uoFHHd9xdd5mfEOtVTxxnhUA1Gg/viewform?usp=sf_link"

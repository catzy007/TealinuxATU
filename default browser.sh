#!/bin/bash

echo ""
echo "This Script Using for checking the default browser"

CHECK=$(cat /usr/share/applications/defaults.list | grep firefox > /dev/null;echo $?)

#Is The Default Browser is Firefox
if [[ "$CHECK" != "0" ]]; then
	echo "The Default Application is not Firefox"
	exit 212
fi

echo ""
echo "Nice! Default Application for browser is Firefox"


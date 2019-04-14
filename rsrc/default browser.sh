#!/bin/bash

echo ""
echo "This Script Using for checking the default browser"
NAMA=NULL

read -p "Nama : " NAMA



CHECK=$(cd /usr/share/applications | whereis $NAMA > /dev/null;echo $?)

#Is The Default Browser is Firefox
if [[ "$CHECK" != "0" ]]; then
	echo "The Default Application is not $NAMA"
	exit 212
fi

echo ""
echo "Nice! Default Application for browser is $NAMA"

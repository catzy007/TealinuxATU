#!/bin/bash

echo ""
echo "Testing Open Apps then kill"

NAMA=NULL

read -p "Nama : " NAMA
APPS=$(pidof $NAMA)

if [[ "$APPS" != "0" ]]; then
	sudo kill $APPS
	echo "Terminated!"
	exit 212
fi

echo ""
echo "Script Doesn't Working"
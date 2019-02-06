#!/bin/bash

echo ""
echo "Testing Open Apps then kill"

NAMA=NULL

read -p "Nama : " NAMA

PID=$(pidof $NAMA)

if [[ "$PID" != "0" ]]; then
	sh -c $NAMA & sleep 10 && sudo kill -s 15 9 $PID
	echo "Terminated!"
	exit 212
fi

echo ""
echo "Script Doesn't Working"
#!/bin/bash
file="/usr/share/tealinux/TealinuxATU/atucore.sh"
link="https://raw.githubusercontent.com/catzy007/TealinuxATU/master/atucore.sh"
if [ "$EUID" -ne 0 ]
  then echo "Please run atu as root!"
  exit
fi
echo "Checking new updates. . ."
rm $file
wget -qN $link -O $file
chmod +x $file
$file $1

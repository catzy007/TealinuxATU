#!/bin/bash
file="/usr/share/tealinux/TealinuxATU/atucore.sh"
link="https://raw.githubusercontent.com/catzy007/TealinuxATU/master/atucore.sh"
if [ "$EUID" -ne 0 ]
  then echo "Cannot set some parameters"; echo "Are you root?"
  exit
fi
echo "Checking new updates. . ."
rm -f $file
wget -qN $link -O $file
chmod +x $file
$file $1

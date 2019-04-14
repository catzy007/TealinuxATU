#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run atu as root!"
  exit
fi
echo "Checking new updates. . ."
wget -qN https://raw.githubusercontent.com/catzy007/TealinuxATU/master/atucore.sh -O /usr/share/tealinux/TealinuxATU/atucore.sh
chmod +x /usr/share/tealinux/TealinuxATU/atucore.sh
/usr/share/tealinux/TealinuxATU/atucore.sh $1

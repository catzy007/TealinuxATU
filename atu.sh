#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
wget -qN https://raw.githubusercontent.com/catzy007/TealinuxATU/master/atucore.sh
chmod +x atucore.sh
./atucore.sh

#!/bin/sh

arg="$1"

case $arg in
	-t1|-test1)
	echo "TealinuxOS Automatic Testing Utility - Test 1"
	dpkg -l
	;;
	*)
	echo "Welcome to TealinuOS Automatic Testing Utility"
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
	echo "  checking if default apps is set correctly"
	;;
esac

#!/bin/sh

RED=`echo '\033[41m\033[37m'`
GREEN=`echo '\033[42m\033[37m'`
WHITE=`echo '\033[47m\033[37m'`
NORMAL=`echo '\033[0m'`

for file in *.scm; do 
	echo "${WHITE}${file}${NORMAL}"
	plt-r5rs $file | sed "s/FAILED/${RED}FAILED${NORMAL}/g" | \
		sed "s/PASSED/${GREEN}PASSED${NORMAL}/g"
	echo
done

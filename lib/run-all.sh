#!/bin/sh

for file in *.scm; do 
	echo $file
	plt-r5rs $file
	echo
done

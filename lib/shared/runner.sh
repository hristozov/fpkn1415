#!/bin/bash

RED=`echo '\033[41m\033[37m'`
GREEN=`echo '\033[42m\033[37m'`
WHITE=`echo '\033[47m\033[37m'`
NORMAL=`echo '\033[0m'`

function printFileHeader ()
{
	file=$1
	echo "${WHITE}${file}${NORMAL}"
}

function printFile () {
	file=$1
	output=$2

	num_passed_local=`cat $output | grep '^PASSED' | wc -l`
	num_failed_local=`cat $output | grep '^FAILED' | wc -l`
	num_total_local=$((num_passed_local + num_failed_local))
	num_passed=$((num_passed + num_passed_local))
	num_failed=$((num_failed + num_failed_local))
	num_total=$((num_total + num_total_local))
	num_files=$((num_files + 1))

	cat $output | \
		sed "s/FAILED/${RED}FAILED${NORMAL}/g" | \
		sed "s/PASSED/${GREEN}PASSED${NORMAL}/g"
}

function printSummary() {
	num_files=$1
	num_passed=$2
	num_failed=$3
	num_total=$((num_passed + num_failed))
	runtime=$4

	if [ $num_failed -gt 0 ]
		then
		echo "${RED}"
	else
		echo "${GREEN}"
	fi
	echo "$num_files files: $num_passed/$num_total passed; took $runtime seconds${NORMAL}"
}

export -f printFileHeader
export -f printFile
export -f printSummary
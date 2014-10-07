#!/bin/bash

BLACK_FOREGROUND=`tput setaf 0`
RED_BACKGROUND=`tput setab 1`
GREEN_BACKGROUND=`tput setab 2`
WHITE_BACKGROUND=`tput setab 7`
NORMAL_COLORS=`tput sgr 0`

startTime=`date +%s`

function printFileHeader () {
	file=$1
	echo "${WHITE_BACKGROUND}${BLACK_FOREGROUND}${file}${NORMAL_COLORS}"
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
		sed "s/FAILED/${RED_BACKGROUND}${BLACK_FOREGROUND}FAILED${NORMAL_COLORS}/g" | \
		sed "s/PASSED/${GREEN_BACKGROUND}${BLACK_FOREGROUND}PASSED${NORMAL_COLORS}/g"

	# newline after every file
	echo
}

function printSummary() {
	num_total=$((num_passed + num_failed))
	
	end=`date +%s`
	runtime=$((end-startTime))

	if [ $num_failed -gt 0 ]
		then
		echo "${RED_BACKGROUND}"
	else
		echo "${GREEN_BACKGROUND}"
	fi

	if [ $num_files -ne 1 ]
		then
		files_suffix="s"
	fi

	if [ $runtime -ne 1 ]
		then
		seconds_suffix="s"
	fi


	echo "${BLACK_FOREGROUND}$num_files file$files_suffix: $num_passed/$num_total passed; \
took $runtime second$seconds_suffix${NORMAL_COLORS}"
}

export -f printFileHeader
export -f printFile
export -f printSummary
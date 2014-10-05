#!/bin/sh

set -e

start=`date +%s`

RED=`echo '\033[41m\033[37m'`
GREEN=`echo '\033[42m\033[37m'`
WHITE=`echo '\033[47m\033[37m'`
NORMAL=`echo '\033[0m'`

num_files=0
num_passed=0
num_failed=0
num_total=0

for file in *.scm; do
	echo "${WHITE}${file}${NORMAL}"
	output=`mktemp -t scmtest`

	plt-r5rs $file > $output

	num_passed_local=`cat $output | grep '^PASSED' | wc -l`
	num_failed_local=`cat $output | grep '^FAILED' | wc -l`
	num_total_local=$((num_passed_local + num_failed_local))
	num_passed=$((num_passed + num_passed_local))
	num_failed=$((num_failed + num_failed_local))
	num_total=$((num_total + num_total_local))
	num_files=$((num_files + 1))

	cat $output | sed "s/FAILED/${RED}FAILED${NORMAL}/g" | \
		sed "s/PASSED/${GREEN}PASSED${NORMAL}/g"

	rm $output

	# newline after every file
	echo
done

end=`date +%s`
runtime=$((end-start))

echo "$num_files files with $num_total tests: $num_passed passed and $num_failed failed; took $runtime seconds"

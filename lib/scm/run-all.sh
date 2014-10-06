#!/bin/sh

set -e

# XXX: Relative paths.
source ../../lib/shared/runner.sh

start=`date +%s`

num_files=0
num_passed=0
num_failed=0
num_total=0

for file in *.scm; do
	printFileHeader $file
	
	output=`mktemp -t scmtest`

	plt-r5rs $file > $output
	printFile $file $output

	rm $output

	# newline after every file
	echo
done

end=`date +%s`
runtime=$((end-start))

printSummary $num_files $num_passed $num_failed $runtime

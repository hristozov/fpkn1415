#!/bin/sh

set -e

. $(dirname $0)/../shared/runner.sh

start=`date +%s`

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

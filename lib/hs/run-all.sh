#!/bin/sh

set -e

. $(dirname $0)/../shared/runner.sh

start=`date +%s`

for file in *.hs; do
	printFileHeader $file
	
	output=`mktemp -t scmtest`

	# XXX: this relative path is a real disaster
	currentDir=$(dirname $0)
	searchPath="$currentDir"
	echo $searchPath
	ghc -i$currentDir $file -o a.out
	./a.out > $output
	printFile $file $output

	rm $output
	rm a.out

	# newline after every file
	echo
done

end=`date +%s`
runtime=$((end-start))

printSummary $num_files $num_passed $num_failed $runtime


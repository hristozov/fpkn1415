#!/bin/sh

set -e

. $(dirname $0)/../shared/runner.sh

for file in *.rkt; do
  printFileHeader $file
  
  output=`mktemp -t scmtest`

  racket $file > $output
  printFile $file $output

  rm $output
done

printSummary

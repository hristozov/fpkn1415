import Unit

qsort [] = []
qsort (x:xs) = lessThan ++ [x] ++ moreThan where
  lessThan = qsort(filter (<=x) xs)
  moreThan = qsort(filter (>x) xs) 

main = do {
  assertEqual [1,2,3] (qsort [1,2,3]);
  assertEqual [1,2,4,7,8] (qsort [8,4,1,7,2])
}
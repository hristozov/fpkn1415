import Unit

withoutElement n l = map (\idx -> l !! idx) (filter (/= n) [0..(length l - 1)])

withoutRow n m = withoutElement n m
withoutColumn n m = map (\row -> withoutElement n row) m

main = do {
  assertEqual [[1, 2, 3], [7, 8, 9]] (withoutRow 1 [[1..3], [4..6], [7..9]]);
  assertEqual [[1, 3], [4, 6], [7, 9]] (withoutColumn 1 [[1..3], [4..6], [7..9]]);
}
import Unit

getColumn n m = map (\row -> row !! n) m

main = do {
  assertEqual [1, 4, 7] (getColumn 0 [[1..3], [4..6], [7..9]])
}
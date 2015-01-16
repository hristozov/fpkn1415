import Unit

getColumn n m = map (\row -> row !! n) m
transpose m = map (\n -> getColumn n m) [0..(length(m!!0) - 1)]

main = do {
  assertEqual [[1, 4, 7], [2, 5, 8], [3, 6, 9]] (transpose [[1..3], [4..6], [7..9]])
}
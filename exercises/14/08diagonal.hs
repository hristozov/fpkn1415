import Unit

diagonal m = map (\idx -> (m !! idx) !! idx) [0..(length m - 1)]

main = do {
  assertEqual [1, 5, 9] (diagonal [[1..3], [4..6], [7..9]])
}
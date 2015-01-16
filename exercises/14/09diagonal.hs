import Unit

diagonal m = map (\idx -> (m !! idx) !! idx) [0..(length m - 1)]
secondDiagonal m = map (\idx -> (m !! idx) !! (length m - idx - 1)) [0..(length m - 1)]

main = do {
  assertEqual [1, 5, 9] (diagonal [[1..3], [4..6], [7..9]]);
  assertEqual [3, 5, 7] (secondDiagonal [[1..3], [4..6], [7..9]]);
}
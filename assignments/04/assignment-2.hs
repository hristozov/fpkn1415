import Unit

mergeTwo [] y = reverse y
mergeTwo x [] = reverse x
mergeTwo x y
  | last x < last y = last x : mergeTwo (init x) y
  | otherwise = last y : mergeTwo x (init y)

merge = foldl (\acc current -> mergeTwo (reverse acc) current) []

main = do {
  assertEqual [1, 2, 3] (mergeTwo [3, 2, 1] []);
  assertEqual [2, 3, 4] (mergeTwo [] [4, 3, 2]);
  assertEqual [1, 2, 2, 3, 3, 4] (mergeTwo [3, 2, 1] [4, 3, 2]);
  assertEqual [1, 1, 2, 2, 2, 3, 3, 4, 5, 7, 8, 9] (merge [[3, 2, 1], [4, 3, 2], [9, 8, 7], [5, 2, 1]]);
}
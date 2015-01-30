import Unit

mergeTwo x y = []

merge l = []

main = do {
  assertEqual [3, 2, 1] (mergeTwo [1, 2, 3] []);
  assertEqual [4, 3, 2] (mergeTwo [] [2, 3, 4]);
  assertEqual [4, 3, 3, 2, 2, 1] (mergeTwo [1, 2, 3] [2, 3, 4]);
  assertEqual [9, 8, 7, 5, 4, 3, 3, 2, 2, 2, 1, 1] (merge [[1, 2, 3], [2, 3, 4], [7, 8, 9], [1, 2, 5]]);
}
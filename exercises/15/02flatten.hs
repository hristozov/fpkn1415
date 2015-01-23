import Unit

flatten :: [[a]] -> [a]
flatten l = foldl (++) [] l

main = do {
  assertEqual [1, 2, 4, 5] (flatten [[1, 2], [4, 5]]);
  assertEqual [1, 2, 4, 5] (flatten [[1], [2], [4], [5]]);
}
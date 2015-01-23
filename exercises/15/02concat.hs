import Unit

concat' :: [[a]] -> [a]
concat' l = foldl (++) [] l

main = do {
  assertEqual [1, 2, 4, 5] (concat' [[1, 2], [4, 5]]);
  assertEqual [1, 2, 4, 5] (concat' [[1], [2], [4], [5]]);
}
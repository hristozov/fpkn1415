import Unit

min' :: (Integral a) => [a] -> a
min' l = foldl min (head l) l

max' :: (Integral a) => [a] -> a
max' l = foldl max (head l) l

main = do {
  assertEqual 2 (min' [3, 7, 2, 5, 8]);
  assertEqual 2 (min' [2]);
  assertEqual 8 (max' [3, 7, 2, 5, 8]);
  assertEqual 8 (max' [8]);
}
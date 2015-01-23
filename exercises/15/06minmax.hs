import Unit

min' :: (Integral a) => [a] -> a
min' l = foldl min (head l) l

min2 :: (Integral a) => [a] -> a
min2 = foldl1 min

max' :: (Integral a) => [a] -> a
max' l = foldl max (head l) l

max2 :: (Integral a) => [a] -> a
max2 = foldl1 max

main = do {
  assertEqual 2 (min' [3, 7, 2, 5, 8]);
  assertEqual 2 (min' [2]);
  assertEqual 2 (min2 [3, 7, 2, 5, 8]);
  assertEqual 2 (min2 [2]);
  assertEqual 8 (max' [3, 7, 2, 5, 8]);
  assertEqual 8 (max' [8]);
  assertEqual 8 (max2 [3, 7, 2, 5, 8]);
  assertEqual 8 (max2 [8]);
}
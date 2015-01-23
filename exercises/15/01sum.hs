import Unit

sum' :: Num a => [a] -> a
sum' l = foldl (\acc x -> acc + x) 0 l

sum2 :: Num a => [a] -> a
sum2 l = foldl (+) 0 l

sum3 :: Num a => [a] -> a
sum3 = foldl (+) 0

sumRange :: (Num a, Enum a) => a -> a -> a
sumRange start end = sum' [start..end]

main = do {
  assertEqual 1 (sum' [1]);
  assertEqual 6 (sum' [1, 2, 3]);
  assertEqual 6 (sum2 [1, 2, 3]);
  assertEqual 6 (sum3 [1, 2, 3]);
  assertEqual 6 (sumRange 1 3);
}
import Unit

reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

main = do {
  assertEqual 1 1;
  assertEqual [1] (reverse' [1]);
  assertEqual [3, 2, 1] (reverse' [1, 2, 3]);
}
import Unit

head' (x:xs) = x

tail' (x:xs) = xs

main = do {
  assertEqual 1 (head' [1, 2, 3]);
  assertEqual [2, 3] (tail' [1, 2, 3]);
}
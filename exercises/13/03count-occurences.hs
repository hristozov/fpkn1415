import Unit

countOccurences x [] = 0
countOccurences x (y:ys) = (if x == y then 1 else 0) + countOccurences x ys

main = do {
  assertEqual 1 (countOccurences 1 [1, 2, 3, 3]);
  assertEqual 2 (countOccurences 3 [1, 2, 3, 3]);
}
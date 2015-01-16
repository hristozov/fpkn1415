import Unit

evens = filter even [1..]
evens2 = map (\x -> x * 2) [1..]

main = do {
  assertEqual [2, 4, 6, 8] (take 4 evens);
  assertEqual [2, 4, 6, 8] (take 4 evens2);
}
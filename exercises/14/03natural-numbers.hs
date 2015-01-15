import Unit

naturals start = start : naturals (start + 1)

main = do {
  assertEqual [1, 2, 3] (take 3 (naturals 1));
  assertEqual [20, 21, 22, 23] (take 4 (naturals 20));
}
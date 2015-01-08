import Unit

genRange start end
  | start == end = [end]
  | otherwise = start : genRange (start+1) end

main = do {
  assertEqual [1] (genRange 1 1);
  assertEqual [1, 2, 3] (genRange 1 3);
  assertEqual [1, 2, 3, 4] (genRange 1 4);
}
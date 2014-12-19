import Unit

max' a b = if a > b 
  then a 
  else b

max2' a b
  | a > b = a
  | otherwise = b

main = do {
  assertEqual 1 (max' 1 0);
  assertEqual 4 (max' 1 4);
  assertEqual 4 (max2' 1 4);
  assertEqual 1 (max2' 1 0)
}

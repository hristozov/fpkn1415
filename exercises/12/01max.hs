import Unit

max' a b = if a > b 
  then a 
  else b

main = do {
  assertEqual 1 (max' 1 0);
  assertEqual 4 (max' 1 4)
}

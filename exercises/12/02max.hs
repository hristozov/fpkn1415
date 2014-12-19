import Unit

-- първи вариант - с if
max' a b = if a > b 
  then a 
  else b

-- втори вариант - с guard
-- забележете индентирането пред | - без него няма да работи
max2' a b
  | a > b = a
  | otherwise = b

main = do {
  assertEqual 1 (max' 1 0);
  assertEqual 4 (max' 1 4);
  assertEqual 4 (max2' 1 4);
  assertEqual 1 (max2' 1 0)
}

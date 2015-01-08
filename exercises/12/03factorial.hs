import Unit

-- първи вариант - с if
fact n = if n == 1 
  then 1 
  else n * fact (n - 1)

-- втори вариант - с guard
-- забележете индентирането пред | - без него няма да работи
fact2 n 
  | n == 1 = 1 
  | otherwise = n * fact2 (n - 1)

-- трети вариант - с pattern matching
fact3 1 = 1
fact3 n = n * fact3 (n - 1)

main = do {
  assertEqual 2 (fact 2);
  assertEqual 24 (fact 4);
  assertEqual 2 (fact2 2);
  assertEqual 24 (fact2 4)
}
import Unit

fact n = if n == 1 
  then 1 
  else n * fact (n - 1)

fact2 1 = 1
fact2 n = n * fact2 (n - 1)

main = do {
  assertEqual 2 (fact 2);
  assertEqual 24 (fact 4);
  assertEqual 2 (fact2 2);
  assertEqual 24 (fact2 4)
}
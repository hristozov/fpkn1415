import Unit

fibonacci n = if n < 2
  then 1
  else fibonacci (n-1) + fibonacci (n-2)

main = do {
  assertEqual 2 (fibonacci 2);
  assertEqual 5 (fibonacci 4)
}
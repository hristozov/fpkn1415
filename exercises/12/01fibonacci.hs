import Unit

fibonacci n = if n < 2
  then 1
  else fibonacci (n-1) + fibonacci (n-2)

fibonacci2 n = fib 1 1 1 where 
  fib previous current i = 
    if i == n
      then current
      else fib current (previous + current) (i + 1)

main = do {
  assertEqual 2 (fibonacci 2);
  assertEqual 5 (fibonacci 4);
  assertEqual 2 (fibonacci2 2);
  assertEqual 5 (fibonacci2 4);
  assertEqual 2504730781961 (fibonacci2 60)
}
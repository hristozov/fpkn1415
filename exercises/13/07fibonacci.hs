import Unit

-- първи вариант - чрез if
fibonacci n = if n < 2
  then 1
  else fibonacci (n-1) + fibonacci (n-2)

-- втори вариант - с pattern matching
fibonacci2 0 = 1
fibonacci2 1 = 1
fibonacci2 n = fibonacci2(n-1) + fibonacci2(n-2)

-- трети вариант - итеративно
fibonacci3 n = fib 1 1 1 where 
  fib previous current i = 
    if i == n
      then current
      else fib current (previous + current) (i + 1)

main = do {
  assertEqual 2 (fibonacci 2);
  assertEqual 5 (fibonacci 4);
  assertEqual 2 (fibonacci2 2);
  assertEqual 5 (fibonacci2 4);
  assertEqual 2 (fibonacci3 2);
  assertEqual 5 (fibonacci3 4);
  assertEqual 2504730781961 (fibonacci3 60)
}
import Unit

-- fact1 n = if n == 1 then 1 else n * fact1 (n - 1)

fact 1 = 1
fact n = n * fact (n - 1)

main = do {
  assertEqual 2 (fact 2);
  assertEqual 24 (fact 4);
}
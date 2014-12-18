import Unit

fact 1 = 1
fact n = n * fact (n - 1)

main = do {
  assertEqual 2 (fact 2);
  assertEqual 24 (fact 4);
}
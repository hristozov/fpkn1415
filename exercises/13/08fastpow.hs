import Unit

fpow x 0 = 1
fpow x n = if even n
  then fpow x (n `div` 2) ** 2
  else x * fpow x (n - 1)

main = do {
  assertEqual 1024 (fpow 2 10);
  assertEqual 2048 (fpow 2 11)
}
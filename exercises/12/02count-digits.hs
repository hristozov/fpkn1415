import Unit

countDigits n
  | n < 10 = 1
  | otherwise = 1 + countDigits (div n 10)

main = do {
  assertEqual 1 (countDigits 2);
  assertEqual 2 (countDigits 20);
  assertEqual 6 (countDigits 123456)
}
import Unit

-- първи вариант - с if
countDigits n = if n < 10
  then 1
  else 1 + countDigits (div n 10)

-- втори вариант - с guard
countDigits2 n
  | n < 10 = 1
  | otherwise = 1 + countDigits2 (div n 10)

main = do {
  assertEqual 1 (countDigits 2);
  assertEqual 2 (countDigits 20);
  assertEqual 6 (countDigits 123456);
  assertEqual 1 (countDigits2 2);
  assertEqual 2 (countDigits2 20);
  assertEqual 6 (countDigits2 123456)
}
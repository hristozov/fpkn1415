import Unit

reverseDigits n = helper n 0 where
  helper i result
    | i <= 0 = result
    | otherwise = helper (i `div` 10) (10 * result + i `mod` 10)

main = do {
  assertEqual 1 (reverseDigits 1);
  assertEqual 123 (reverseDigits 321);
  assertEqual 1 (reverseDigits 100000)
}
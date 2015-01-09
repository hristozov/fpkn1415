import Unit

-- първи варинт - с външен helper
helper i result
    | i <= 0 = result
    | otherwise = helper (i `div` 10) (10 * result + i `mod` 10)
reverseDigits n = helper n 0

-- втори вариант - вложена дефиниция с where
reverseDigits2 n = helper n 0 where
  helper i result
    | i <= 0 = result
    | otherwise = helper (i `div` 10) (10 * result + i `mod` 10)

-- трети вариант, чрез let ... in
reverseDigits3 n = let
  helper i result
    | i <= 0 = result
    | otherwise = helper (i `div` 10) (10 * result + i `mod` 10)
  in helper n 0

main = do {
  assertEqual 1 (reverseDigits 1);
  assertEqual 123 (reverseDigits 321);
  assertEqual 1 (reverseDigits 100000);
  assertEqual 1 (reverseDigits2 1);
  assertEqual 123 (reverseDigits2 321);
  assertEqual 1 (reverseDigits2 100000);
  assertEqual 1 (reverseDigits3 1);
  assertEqual 123 (reverseDigits3 321);
  assertEqual 1 (reverseDigits3 100000)
}

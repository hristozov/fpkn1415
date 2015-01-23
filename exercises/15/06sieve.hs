import Unit

sieve :: (Integral a)=> [a]
sieve = helper [2..] where
  helper (x:xs) = x : helper (filter (\el -> el `mod` x > 0) xs)

main = do {
  assertEqual [2, 3, 5, 7, 11] (take 5 sieve);
}
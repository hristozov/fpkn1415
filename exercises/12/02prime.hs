import Unit

prime 1 = False
prime n = 
  helper (n - 1)
  where 
    helper 1 = True
    helper divisor = mod n divisor /= 0 && helper (divisor - 1)

main = do {
  assertTrue (prime 5);
  assertFalse (prime 4)
}
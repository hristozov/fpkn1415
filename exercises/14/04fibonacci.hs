import Unit

fibonacci = helper 1 1 where
  helper a b = a : helper b (a + b)

-- може и да map-нем реализация на fib върху [1..]

main = assertEqual [1, 1, 2, 3, 5, 8, 13, 21, 34, 55] (take 10 fibonacci)
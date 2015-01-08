import Unit

elem' x [] = False
elem' x (y:ys) = x == y || elem' x ys

{- невалидно: elem' x (x:xs) = True -}

main = do {
  assertTrue (elem' 1 [1, 2, 3]);
  assertFalse (elem' 4 [1, 2, 3]);
}
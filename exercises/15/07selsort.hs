import Unit

min' :: (Integral a) => [a] -> a
min' l = foldl min (head l) l

withoutFirst :: Eq a => [a] -> a -> [a]
withoutFirst [] y = []
withoutFirst (x:xs) y = if x == y then xs else x : withoutFirst xs y

selsort :: Integral a => [a] -> [a]
selsort [] = []
selsort l = minElement : selsort (withoutFirst l minElement) where
  minElement = min' l


main = do {
  assertEqual [1, 2, 3] (withoutFirst [1, 1, 2, 3] 1);
  assertEqual [1, 2, 3] (withoutFirst [1, 2, 3] 4);
  assertEqual [1, 2, 3] (withoutFirst [1, 2, 3, 4] 4);
  assertEqual [1, 2, 3] (withoutFirst [1, 2, 4, 3] 4);
  assertEqual [1, 1, 2, 2, 3, 4, 5, 7, 8, 9] (selsort [1, 8, 2, 4, 9, 1, 2, 5, 7, 3]);
}
import Unit

map' :: (a -> b) -> [a] -> [b]
map' f l = foldl (\acc x -> acc ++ [f x]) [] l

map2 :: (a -> b) -> [a] -> [b]
map2 f l = foldr (\x acc -> f x : acc) [] l

map3 :: (a -> b) -> [a] -> [b]
map3 f = foldr (\x acc -> f x : acc) []

main = do {
  assertEqual [2, 4, 6, 8, 10, 12, 14] (map' (* 2) [1..7]);
  assertEqual [2, 4, 6, 8, 10, 12, 14] (map2 (* 2) [1..7]);
  assertEqual [2, 4, 6, 8, 10, 12, 14] (map3 (* 2) [1..7]);
}
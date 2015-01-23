import Unit

filter' :: (a -> Bool) -> [a] -> [a]
filter' p l = foldl (\acc x -> if p x then acc ++ [x] else acc) [] l

filter2 :: (a -> Bool) -> [a] -> [a]
filter2 p l = foldr (\x acc -> if p x then x : acc else acc) [] l

filter3 :: (a -> Bool) -> [a] -> [a]
filter3 p = foldr (\x acc -> if p x then x : acc else acc) []

main = do {
  assertEqual [2, 4, 6] (filter' even [1..7]);
  assertEqual [2, 4, 6] (filter2 even [1..7]);
  assertEqual [2, 4, 6] (filter3 even [1..7]);
}
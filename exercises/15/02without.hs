import Unit

without l el = foldl (\acc x -> if x == el then acc else acc ++ [x]) [] l
without2 l el = foldr (\x acc -> if x == el then acc else x : acc) [] l

main = do {
  assertEqual [1, 2, 4, 5] (without [3, 1, 2, 3, 4, 5, 3] 3);
  assertEqual [1, 2, 4, 5] (without2 [3, 1, 2, 3, 4, 5, 3] 3);
  assertEqual [1, 2, 3] (without [1, 2, 3] 5);
  assertEqual [1, 2, 3] (without2 [1, 2, 3] 5);
}
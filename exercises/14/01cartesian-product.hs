import Unit

mul [] y = []
mul (x:xs) y = [x, y] : mul xs y

cartesianProduct l1 [] = []
cartesianProduct l1 (x:xs) = (mul l1 x) ++ cartesianProduct l1 xs


main = do {
  assertEqual [[1, 2], [2, 2], [3, 2]] (mul [1, 2, 3] 2);
  assertEqual [[1, 4], [2, 4], [3, 4], [1, 5], [2, 5], [3, 5], [1, 6], [2, 6], [3, 6]] (cartesianProduct [1, 2, 3] [4, 5, 6]);
}
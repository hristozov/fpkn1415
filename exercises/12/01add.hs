import Unit

addTwo x = x + 2

add x y = x + y

addFour = add 4

main = do {
  assertEqual 5 (addTwo 3);
  assertEqual 7 (add 3 4);
  assertEqual 11 (addFour 7)
}
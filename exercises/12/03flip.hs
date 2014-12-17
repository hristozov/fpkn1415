import           Unit

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = \x y -> f y x

main = do {
  let 
    gte = (flip' (<))
    lt = (flip' gte)
  in do {
    assertFalse (gte 1 3);
    assertTrue (lt 1 3);
  }
}

module Unit where

assert :: Bool -> String -> IO ()
assert False message = putStrLn ("FAILED: " ++ message)
assert True  message = putStrLn ("PASSED: " ++ message)

assertEqual :: (Show a, Eq a) => a ->  a -> IO ()
assertEqual expected actual =
	assert (expected == actual) (show expected ++ "==" ++ show actual)

assertTrue :: Bool -> IO ()
assertTrue actual =
	assertEqual True actual

assertFalse :: Bool -> IO ()
assertFalse actual =
	assertEqual False actual

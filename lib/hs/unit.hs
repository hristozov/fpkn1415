module Unit where

assert :: Bool -> String -> String
assert False message = ("FAILED: " ++ message)
assert True  message = ("PASSED: " ++ message)

assertEqual :: (Show a, Eq a) => a ->  a -> String
assertEqual expected actual =
	assert (expected == actual) (show expected ++ "==" ++ show actual)

assertTrue :: Bool -> String
assertTrue actual =
	assertEqual True actual

assertFalse :: Bool -> String
assertFalse actual =
	assertEqual False actual

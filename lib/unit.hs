module Unit where

assert :: Bool -> String -> String
assert False message = ("FAILED: " ++ message)
assert True  message = ("PASSED: " ++ message)

assertEqual :: Int -> Int -> String
assertEqual expected actual =
	assert (expected == actual) (show expected ++ "==" ++ show actual)

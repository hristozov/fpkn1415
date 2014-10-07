import Unit

myEven :: Int -> Bool
myEven x = mod x 2 == 0

main :: IO()
main = do
	assertTrue (myEven 2)
	assertFalse (myEven 3)
	assertTrue (myEven 4)
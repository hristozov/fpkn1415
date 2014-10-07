import Unit

myEven :: Int -> Bool
myEven x = mod x 2 == 0

main :: IO()
main = do
	print (assertTrue (myEven 2))
	print (assertFalse (myEven 3))
	print (assertTrue (myEven 4))
import Core.Tests
import Data.List

limit = 9 -- because we are looking for a 1-9 pandigital number, doesnt make sense to include 10

concatenatedProduct n = (read (last list) :: Int, length list)
	where list = takeWhile (\n -> length n <= limit)
					$ scanl (\acc test -> acc ++ (show (n * test))) "" [1..]
	
main = do print
	$ sort
	$ filter isPandigital
	$ map (\(product,_) -> product)
	$ filter (\(_,len) -> len >= 2)
	$ map concatenatedProduct [2..1000000]

import Factory.Math.Implementations.Primes.SieveOfEratosthenes
import Core
import Data.List

test _ [] = []
test limit primes@(x:xs) = (process 1 $ takeWhile (<=limit) $ scanl1 (+) primes) : test limit xs
	where
		process _ [] = []
		process count (x:xs)
		 	| millerRabinPrimality x 2 = (count, fromIntegral x) : process (count+1) xs
			| otherwise = process (count+1) xs

main = do
		print "Enter limit: "
		strLimit <- getLine
		let limit = read strLimit
		print
			$ snd
			$ last
			$ sortBy (\(a1,b1) (a2,b2) -> compare a1 a2)
			$ concat
			$ test limit
			$ takeWhile (<limit)
			$ sieveOfEratosthenes $ fromIntegral limit

import Factory.Math.Implementations.Primes.SieveOfEratosthenes

replaceNth n newVal (x:xs)
     | n == 0 = newVal:xs
     | otherwise = x:replaceNth (n-1) newVal xs

replacementIndexes n = [(start,end) | start <- [0..lenn], end <- [start+1..lenn]]
	where
		lenn = length strn
		strn = show n

primes = sieveOfEratosthenes 10

main = print
	$ takeWhile predicate primes
	where
		predicate prime =
			$ map (\n -> replaceNth n newVal (show prime))
			$ [[start..end] | (start,end) <- replacementIndexes prime, ]

import Factory.Math.Implementations.Primes.SieveOfEratosthenes
import Factory.Math.Primality
import Core
import qualified Data.IntSet as Set


primes = takeWhile (<1000000) $ sieveOfEratosthenes 1000000
limit = length primes

main = do 
	print limit
	print
		-- $ maximum
		-- $ map sum
		$ length
		$ map getRange [ (start, end) | start <- [0..limit], end <- [start..limit] ]
		where
			getRange (start,end) = takeStartingAt start (end - start) primes
		
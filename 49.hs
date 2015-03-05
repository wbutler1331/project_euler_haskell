import Data.List
import Factory.Math.Primality
import Factory.Math.Implementations.Primality
import Factory.Math.Implementations.PrimeFactorisation

let rev [] = []
let rev str = (last str) : rev (init str)

toInt n = read n :: Integer



primePermutations n = map toInt $ permutations $ show n

findSeries = worker [] 1000 -- start at 1000 with no cache
	where
		worker _ 9999 = [] -- end at 9999 because we're only considering 4 digit numbers
		worker alreadyChecked currentNumber
			| currentNumber `elem` alreadyChecked = worker alreadyChecked nextNumber -- remove some duplication of effort
			| otherwise                           = answers : worker (perms ++ alreadyChecked) nextNumber
			where
				answers =  [[x,y,z] | x <- perms,  -- find the combination of perms where
									 y <- perms, 
									 z <- perms, 
									 y-x == z-y,   -- they are linearly increasing
									 x /= y,       -- the terms dont equal each other
									 y /= z,
									 x /= z,
									 all (\n -> millerRabinPrimality n 592) [x,y,z]] -- and they're all prime...note that millerRabin used here for perf reasons...faster to get something probably prime and then explicitly exclude any pseudo primes than to perform a full primality check every time
				perms = filter (>1000) $ map toInt $ permutations strn -- get the permutations and make sure they're > 1k to account for numbers with leading 0s (dont want to include [5,000,0005,...]
				strn = show currentNumber
				nextNumber = currentNumber + 1
				
main = do
	print findSeries
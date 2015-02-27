import Data.List
import Factory.Math.Primality
import Factory.Math.Implementations.Primality
import Factory.Math.Implementations.PrimeFactorisation

toInt n = read n :: Integer

-- (eq. to) find2km (2^k * n) = (k,n)
find2km :: Integral a => a -> (a,a)
find2km n = f 0 n
    where 
        f k m
            | r == 1 = (k,m)
            | otherwise = f (k+1) q
            where (q,r) = quotRem m 2        
 
-- n is the number to test; a is the (presumably randomly chosen) witness
millerRabinPrimality :: Integer -> Integer -> Bool
millerRabinPrimality n a
    | a <= 1 || a >= n-1 = 
        error $ "millerRabinPrimality: a out of range (" 
              ++ show a ++ " for "++ show n ++ ")" 
    | n < 2 = False
    | even n = False
    | b0 == 1 || b0 == n' = True
    | otherwise = iter (tail b)
    where
        n' = n-1
        (k,m) = find2km n'
        b0 = powMod n a m
        b = take (fromIntegral k) $ iterate (squareMod n) b0
        iter [] = False
        iter (x:xs)
            | x == 1 = False
            | x == n' = True
            | otherwise = iter xs
 
-- (eq. to) pow' (*) (^2) n k = n^k
pow' :: (Num a, Integral b) => (a->a->a) -> (a->a) -> a -> b -> a
pow' _ _ _ 0 = 1
pow' mul sq x' n' = f x' n' 1
    where 
        f x n y
            | n == 1 = x `mul` y
            | r == 0 = f x2 q y
            | otherwise = f x2 q (x `mul` y)
            where
                (q,r) = quotRem n 2
                x2 = sq x
 
mulMod :: Integral a => a -> a -> a -> a
mulMod a b c = (b * c) `mod` a
squareMod :: Integral a => a -> a -> a
squareMod a b = (b * b) `rem` a
 
-- (eq. to) powMod m n k = n^k `mod` m
powMod :: Integral a => a -> a -> a -> a
powMod m = pow' (mulMod m) (squareMod m)

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
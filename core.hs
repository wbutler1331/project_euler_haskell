module Core where

import Data.List

-- Primality and Exponentiation

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

isPalindrome n = strn == rstrn
  where
    strn = show n
    rstrn = reverse strn

isLychrel n = worker 0 n
  where
    worker count n
      | count == 50         = True
      | isPalindrome answer = False
      | otherwise           = worker (count+1) answer
      where
        answer = (read rstrn :: Integer) + n
        strn = show n
        rstrn = reverse strn

factorial n = product [n, n-1 .. 1]

nCr n r = n' `div` r'
    where
    -- unroll just what you need and nothing more
    n' = product [n, n-1 .. n-r+1]
    r' = factorial r

containsSameDigits x y = (sort strx) == (sort stry)
  where
    strx = show x
    stry = show y

rmdups list = map (head . group . sort) list

toInt n = read n :: Int

takeStartingAt offset n list = take n (drop offset list)

takeWrap n list
  | n > listlen = list ++ (takeWrap (n-listlen) list)
  | otherwise = take n list
    where
      listlen = length list

takeWrapAt offset n list = drop offset $ takeWrap (n+offset) list

isPandigital n = let strn = show n in (sort strn) == (concatMap show [1..length strn])

--square

isSquare n = sq * sq == n
    where sq = floor $ sqrt $ (fromIntegral n::Double)

--hexagonal

isHexagonal n = (floor (sqrt (fromIntegral (8*n+1))) + 1) `mod` 4 == 0

--pentagonal

pentagonal = let worker n = ((n*(3*n-1))/2) : worker (n+1) in worker 1

isPentagonal n = isSquare test && ((floor rootTest) `mod` 6) == 5
  where
      test = 24*n+1
      rootTest = sqrt $ fromIntegral test
	  


--triangular

triangular = let worker n = (n*(n+1))/2 : worker (n+1) in worker 1

isTriangular n = let test = (8*n+1) in isSquare test && odd test

module Core where

import Data.List
import Factory.Math.PrimeFactorisation
import Factory.Math.Implementations.PrimeFactorisation

nTimesAPowerOf test base = worker 0 test base
  where
    worker times test base
      | test `mod` base == 0 = worker (times + 1) (floor ((fromIntegral test)/(fromIntegral base))) base
      | otherwise = times


sumFactors testNumber = product
  $ map predicate
  $ nub                                    -- remove duplicates
  $ map (\(a,b) -> a)                      -- transform from [(Int,Int)] to [Int]
  $ primeFactors FermatsMethod testNumber  -- calclate prime factors
  where
    predicate n = floor (fromIntegral ((n^((testNumber `nTimesAPowerOf` n)+1))-1)/(fromIntegral (n-1)))

isAbundant' testNumber = ((sumFactors testNumber) - testNumber) > testNumber

isAbundant n = (sum $ properFactors n) > n

properFactors n = filter (/=n) $ factors n

factors n = rmdups $ concat $ [ [x,(floor ((fromIntegral n)/(fromIntegral x)))] | x <- [1..(floor ((fromIntegral n)/2))], (n `mod` x) == 0 ]

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

rmdups = map head . group . sort

toInt n = read n :: Int

takeStartingAt offset n list = take n (drop offset list)

takeWrap n list
  | n > listlen = list ++ (takeWrap (n-listlen) list)
  | otherwise = take n list
    where
      listlen = length list

takeWrapAt offset n list = drop offset $ takeWrap (n+offset) list


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

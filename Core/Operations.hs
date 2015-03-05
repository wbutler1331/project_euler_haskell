module Core.Operations where

import Data.List
import Factory.Math.PrimeFactorisation
import Factory.Math.Implementations.PrimeFactorisation


nTimesAPowerOf test base = worker 0 test base
  where
    worker times test base
      | test `mod` base == 0 = worker (times + 1) (floor ((fromIntegral test)/(fromIntegral base))) base
      | otherwise = times


factorial n = product [n, n-1 .. 1]

sumFactors testNumber = product
  $ map predicate
  $ nub                                    -- remove duplicates
  $ map (\(a,b) -> a)                      -- transform from [(Int,Int)] to [Int]
  $ primeFactors FermatsMethod testNumber  -- calclate prime factors
  where
    predicate n = floor (fromIntegral ((n^((testNumber `nTimesAPowerOf` n)+1))-1)/(fromIntegral (n-1)))

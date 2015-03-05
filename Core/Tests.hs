module Core.Tests where

import Data.List

containsSameDigits x y = (sort strx) == (sort stry)
  where
    strx = show x
    stry = show y

isTriangular n = let test = (8*n+1) in isSquare test && odd test

isPentagonal n = isSquare test && ((floor rootTest) `mod` 6) == 5
  where
      test = 24*n+1
      rootTest = sqrt $ fromIntegral test



isSquare n = sq * sq == n
    where sq = floor $ sqrt $ (fromIntegral n::Double)
	
isHexagonal n = (floor (sqrt (fromIntegral (8*n+1))) + 1) `mod` 4 == 0

isPandigital n = let strn = show n in (sort strn) == (concatMap show [1..length strn])

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
		

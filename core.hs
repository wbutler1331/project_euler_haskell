module Core where

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

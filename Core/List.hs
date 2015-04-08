module Core.List where

import Data.List

anyN n f = (==n) . last . takeWhile (<=n) . scanl (\acc i -> if f i then acc+1 else acc) 0

takeStartingAt offset n list = take n (drop offset list)

takeWrap n list
  | n > listlen = list ++ (takeWrap (n-listlen) list)
  | otherwise = take n list
    where
      listlen = length list

takeWrapAt offset n list = drop offset $ takeWrap (n+offset) list

headOr def []     = def
headOr _   (x:xs) = x

percentWhere f list = (fromIntegral $ (length $ filter f list)) / (fromIntegral $ length list)

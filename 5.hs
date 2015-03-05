

main = print $ last $ takeWhile (\n -> not $ (all (\t -> n `mod` t == 0) [1..20])) [2520,2540..]

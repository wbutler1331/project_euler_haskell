main = print $ sum $ filter (\n -> n `mod` 3 == 0 || n `mod` 5 == 0) [1..999]

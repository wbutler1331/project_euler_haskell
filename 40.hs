main = print $ foldr (\n acc -> acc*(read [((concatMap show [1..1000000])!!(n-1))] :: Int)) 1 $ map (\n -> read ("1"++(replicate n '0')) :: Int) [0..6]

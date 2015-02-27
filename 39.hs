import Data.List

rmdups = map head . group . sort
solutions n = length $ rmdups $ map sort [[a,b] | a <- [1..(n/2)], b <- [1..(n/2)], a+b+(sqrt $ (a**2)+(b**2))==n]
main = print $ head $ sortBy (\(p1,s1) (p2,s2) -> compare s2 s1) $ map (\n -> (n,solutions n)) [120..1000]

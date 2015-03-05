import Core.Probability

main = do
  print $ length $ [ (n,r) | n <- [1..100], r <- [1..n], (n `nCr` r) > 1000000 ]

import Core

main = do
  print $ length $ filter isLychrel $ [1..10000]

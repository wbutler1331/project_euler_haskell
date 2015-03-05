import Core.Tests

main = do
  print $ length $ filter isLychrel $ [1..10000]

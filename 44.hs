import Core.Series
import Core.Tests

curious (x,y) = (isPentagonal $ floor (x+y)) && (isPentagonal $ floor (x-y))


main = do
  print
    $ map (\(x,y) -> x - y)
    $ filter curious
    $ [ (x,y) | x <- take 5000 pentagonal, y <- take 5000 pentagonal ]

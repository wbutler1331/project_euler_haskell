import Data.List
import Core.List



curious n = all substrDivisibleBy pairs
  where
    substrDivisibleBy (offset, divisor) = ((read $ takeStartingAt offset 3 strn) `mod` divisor) == 0
    strn = show n
    pairs = [(7,17),(6,13),(5,11),(4,7),(3,5),(2,3),(1,2)]

main = do
  print
    $ sum
    $ filter curious
    $ map (read . concatMap (show))
    $ permutations [0..9]

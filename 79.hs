import Data.List
import Data.Maybe
import Data.List.Ordered hiding (nub)

works master current
  | Nothing `elem` indexes = False
  | otherwise = isSorted $ map fromJust indexes
  where
    indexes = map (`elemIndex` master) current

main = do
  contents <- readFile "files/p079_keylog.txt"
  let
    -- all the numbers we care about testing
    numbers = map show $ sort $ nub $ map (\n -> read n :: Int) $ lines contents
    -- the minimum number of digits that can possibly satisfy this condition
    digits  = tail $ nub $ concatMap show numbers
  print
    $ filter (\m -> all (\n -> works m n) numbers)
    $ permutations digits -- see if any combination of the min possible digits work

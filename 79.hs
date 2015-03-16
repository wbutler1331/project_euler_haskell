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
    numbers = map show $ sort $ nub $ map (\n -> read n :: Int) $ lines contents
    digits = tail $ nub $ concatMap show numbers
  print
    $ filter (\m -> all (\n -> works m n) numbers)
    $ permutations digits

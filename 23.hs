import Core
import Data.List
import qualified Data.IntSet as Set

limit :: Int
limit = 28123

list :: [Int]
list = [12..limit]

xlist = filter isAbundant' list

main = do
  --print $ notNums
  print $ Set.fold (+) 0 nums
  where
    nums     = Set.difference wholeSet notNums
    wholeSet = Set.fromDistinctAscList [1..limit]
    notNums  = Set.fromList [ x+y | x <- xlist, y <- xlist, y>=x, x+y <= limit ]

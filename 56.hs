import Core
import Data.List

digitSum n = sum $ map (\n -> toInt [n]) (show n)

main = do
  print $ last $ sort $ map digitSum [ x^y | x <- [2..100], y <- [2..100] ]

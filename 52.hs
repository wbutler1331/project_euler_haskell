import Data.List

containsSameDigits x y = (sort strx) == (sort stry)
  where
    strx = show x
    stry = show y

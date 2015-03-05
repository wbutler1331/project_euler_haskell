import Core.Series
import Core.Tests


main = print
  $ filter (isPentagonal . floor)
  $ filter (isHexagonal . floor)
  $ take 100000 triangular

import Data.Number.CReal
import Core.List
import Data.List



main = print
    $ sortBy (\(_,a) (_,b) -> compare a b)
    $ map (\n -> (n,lengthRepeating n))
    $ filter (\n -> length n == 100)
    $ map ((drop 2) . (showCReal 100) . (1/)) [1..1000]

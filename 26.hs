import Data.Number.CReal
import Core.List
import Data.List
import Text.Regex.PCRE

lengthRepeating n = case res of
                      []   -> 0
                      list -> length $ (!!1) $ last $ sortBy (\a b -> (p a) `compare` (p b)) list
                    where
                        p = maximum . map length
                        res = (n =~ "(.+?)\\1+" :: [[String]])

main = print
  $ last
  $ sortBy (\(_,a) (_,b) -> compare a b)
  $ map (\(n,d) -> (n,lengthRepeating d))
  $ map (\n -> (n, drop 2 $ showCReal 5000 $ 1/n)) [1..1000]

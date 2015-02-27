import Data.Char


isTriangular n = let test = (8*n+1) in isSquare test && odd test
wordScore word = sum $ map (\letter -> (ord $ toUpper letter)-64) word

main = do
  txt <- readFile "./p042_words.txt"
  let
    words = lines txt
  print "foo"

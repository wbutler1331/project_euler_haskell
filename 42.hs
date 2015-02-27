import System.IO
import Data.Char

score word = sum $ map (\c -> (ord c) - 64) word

isSquare n = sq * sq == n
    where sq = floor $ sqrt $ (fromIntegral n::Double)

isTriangular n = isSquare $ (8*n)+1

main = do
	txt <- readFile "p042_words.txt"
	let
		words = lines txt
		results = filter (isTriangular . score) words
	print $ length $ results

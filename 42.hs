import Core.Tests
import Data.Char

score = sum . map (\c -> (ord c) - 64)

main = do
	txt <- readFile "./files/p042_words.txt"
	let
		words = lines txt
		results = filter (isTriangular . score) words
	print $ length $ results

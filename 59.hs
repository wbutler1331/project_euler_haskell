import qualified Data.Text as T
import Data.Char
import Data.Bits

--TODO: make this more efficient by stopping when N is reached
atLeastN predicate n list = (length $ filter predicate list) >= n

isProbablyEnglish text = atLeastN (\word -> word `elem` (words text)) 3 commonWords
	where
		commonWords = ["the", "be", "to", "of", "and"]

decrypt password text = text `txtxor` key
	where
		key = txtpad password (length text)

txtpad str n = take n [str!!(i `mod` (length str)) | i <- [0..] ]

txtxor stra strb = map chr $ zipWith xor (map ord stra) (map ord strb)

main = do
	contents <- readFile filename
	let
		text = T.replace (T.pack "\n") (T.pack "") (T.pack contents) 
		chars = T.splitOn (T.pack ",") text
		cipherText = map (chr . read . T.unpack)  chars
		keys = [ a : b : c : [] | a <- ['a'..'z'], b <- ['a'..'z'], c <- ['a'..'z'] ]
		possiblePlainTexts = map ((flip decrypt) cipherText) keys
		probablePlainTexts = filter isProbablyEnglish possiblePlainTexts
	print 
		$ sum
		$ map ord
		$ head probablePlainTexts

	where 
		filename =  "files/p059_cipher.txt"

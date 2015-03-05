module Core.String where

import Data.String.Utils

replaceAny :: [String] -> String -> String -> String
replaceAny [""] _ baseString = baseString
replaceAny targetStrings replacementString baseString = foldr (\currentTarget currentBaseString -> replace currentTarget replacementString currentBaseString) baseString targetStrings

replaceAt :: String -> Int -> String -> String
replaceAt [] _ _               = []
replaceAt (x:xs) 0 replacement = replacement ++ xs
replaceAt base index replacement
	| index > (length base) + 1 = base
	| otherwise                 = (take index base) ++ replacement ++ (drop (index+1) base)

import Data.List
import Data.String.Utils

replaceAny :: [String] -> String -> String -> String
replaceAny [""] _ baseString = baseString
replaceAny targetStrings replacementString baseString = foldr (\currentTarget currentBaseString -> replace currentTarget replacementString currentBaseString) baseString targetStrings

charToString char = [char]
--------------------------------------------------------------------------
--Proj Euler 33 Test
--------------------------------------------------------------------------

isCurious :: Int -> Int -> Bool
isCurious num denom
	| strNewNum == "" || strNewDenom == "" = False
	| num == denom              = False
	| (length commonChars) == 0 = False
	| trivial                   = False
	| otherwise 				= (newNum / newDenom) == ((fromIntegral num) / (fromIntegral denom))
		where
			newNum       = fromIntegral (read (strNewNum) :: Int)                -- get rid of any common chars in the num
			newDenom     = fromIntegral (read (strNewDenom) :: Int)              -- get rid of any common chars in the denom
			commonChars  = map charToString $ intersect strNum strDenom                                 -- find the common chars in each
			strNum       = show num                                                    -- num as string
			strDenom     = show denom    			-- denom as string
			strNewNum   = replaceAny commonChars "" strNum
			strNewDenom  = replaceAny commonChars "" strDenom
			trivial      = commonChars == ["0"]
			
main = do
	let 
		pairs = [ (num,denom) | num <- [1..99], denom <- [num..99], isCurious num denom ]
		(finalNum, finalDenom) = foldl (\(num,denom) (accNum,accDenom) -> (num*accNum,denom*accDenom)) (1,1) pairs
		reducedDenom = (fromIntegral finalDenom) / (fromIntegral (gcd finalNum finalDenom))
	print reducedDenom
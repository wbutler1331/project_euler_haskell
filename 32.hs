import Core.List
import Data.List

pandigitalProducts strnum = map (\(_,_,p) -> p)
	$ filter interesting 
	$ map getComponents [ (multiplicandLength,multiplierLength) | multiplicandLength <- [1..limit],
																  multiplierLength <- [1..limit],
																  multiplicandLength + multiplierLength < limit]
																	   
	where
		limit = (length strnum) - 2
		interesting (multiplicand,multiplier,product) = multiplicand*multiplier == product
		getComponents (multiplicandLength, multiplierLength) = (multiplicand,multiplier,product)
			where
			multiplicand = read (take multiplicandLength strnum) :: Int
			multiplier   = read (takeStartingAt multiplicandLength multiplierLength strnum) :: Int
			product      = read (drop (multiplicandLength + multiplierLength) strnum) :: Int
		

main = do
	print
		$ sum
		$ nub
		$ concat
		$ map pandigitalProducts
		$ map (concatMap show) 
		$ permutations [1..9]

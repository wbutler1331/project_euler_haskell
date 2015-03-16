generator base power
	| stopCondition = []
	| lenResult > power = generator 1 (power+1)
	| lenResult == power = (base,power,result) : generator (base+1) power
	| otherwise = generator (base+1) power
	where
		result = base^power
		lenResult = length $ show result
		stopCondition = (length $ show $ 2^power) > power

main = do
	print $ scanl (\acc _ -> 1+acc) 0 $ generator 1 1

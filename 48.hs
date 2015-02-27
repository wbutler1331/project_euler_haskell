series :: [Integer]
series = worker 1
		where
			worker n = (n^n) : worker (n+1)
				where integerN = fromIntegral n :: Integer

takeLastN n list = drop ((length list) - n) list

main = do
	print $ takeLastN 10 $ show $ sum $ take 1000 $ series
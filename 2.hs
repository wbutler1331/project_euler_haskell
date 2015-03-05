import Core.Series

main = print $ sum $ filter even $ takeWhile (<4000000) $ fibs

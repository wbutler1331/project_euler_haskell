import Core.Tests

curious n = all (containsSameDigits n) $ map (n*) [1..6]

main = print $ (+1) $ last $ takeWhile (not . curious) [1..]

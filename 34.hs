import nFactory.Math.Factorial
import Factory.Math.Implementations.Factorial

isCurious 1 = False
isCurious 2 = False
isCurious n = sum (map (\n -> factorial Bisection (read [n] :: Int)) (show n)) == n

main = do
	print [ n | n <- [1..1000000], isCurious n ] --TODO: figure out the upper bound
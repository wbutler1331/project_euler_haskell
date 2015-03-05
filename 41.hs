import Data.List
import Core.Primality


main = do
    print
		$ maximum
		$ filter (\n -> millerRabinPrimality n 5)
		$ map (\n -> read n :: Integer)
		$ map (concatMap show)
		$ permutations [1..7]

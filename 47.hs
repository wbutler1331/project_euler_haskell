import Factory.Math.PrimeFactorisation
import Factory.Math.Implementations.PrimeFactorisation

consecutivePrimeFactors sequenceLength startingNum = all (hasNPrimeFactors sequenceLength) [startingNum..endingNum]
	where
		endingNum = startingNum + sequenceLength - 1
		hasNPrimeFactors numberOfFactors number = numberOfFactors == (length $ primeFactors FermatsMethod number)

main = do
	print $ (1+) $ last $ takeWhile (not . consecutivePrimeFactors 4) [1..]
	
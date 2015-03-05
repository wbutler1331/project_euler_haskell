import Factory.Math.PrimeFactorisation
import Factory.Math.Implementations.PrimeFactorisation

limit :: Integer
limit = 600851475143

main = print $ maximum $ primeFactors FermatsMethod limit

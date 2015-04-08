import Factory.Math.Implementations.Primes.SieveOfEratosthenes
import Core.Primality

primes       = sieveOfEratosthenes 10
squares      = map (^2) [1..]
isGoldbach n = any (==n) [prime+(2*square) | prime <- relPrimes, square <- relSquares]
              where
                relPrimes  = takeWhile(<=n) primes
                relSquares = takeWhile(<=n) squares

main = print
  $ (+2)
  $ last
  $ takeWhile isGoldbach
  $ filter (not . (millerRabinPrimalityFor [3,5,7])) [35,37..]

import Core
import Data.List
import Data.Set (member, fromDistinctAscList)
import Factory.Math.Primality
import Factory.Math.Implementations.Primality
import Factory.Math.Implementations.PrimeFactorisation
import Factory.Math.Implementations.Primes.SieveOfEratosthenes

circlePerms n = map (\i -> toInt $ takeWrapAt i strlen strn) [0..strlen-1]
  where
    strn = show n
    strlen = length strn



primes = takeWhile (<= 1000000) $ sieveOfEratosthenes 10000000
setPrimes = fromDistinctAscList primes



main = do
  print
    $ length
    $ filter (\perms -> all (\p -> p `member` setPrimes) perms)
    $ map circlePerms primes

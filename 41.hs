import Factory.Math.Implementations.Primes.SieveOfEratosthenes
import Data.Set (member, fromDistinctAscList)
import Data.List


primes = takeWhile (<= 9999999999) $ sieveOfEratosthenes 9999999999
setPrimes = fromDistinctAscList primes

isPandigital n = let strn = show n in (sort strn) == (concatMap show [1..length strn])

main = do
    print
      $ head
      $ sort
      $ filter (\n -> n `member` setPrimes)
      $ filter isPandigital [123456789..987654321]

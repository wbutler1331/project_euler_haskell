import Factory.Math.Implementations.Primes.SieveOfEratosthenes
import Data.Set (member, fromDistinctAscList)

primes = takeWhile (<= 1000000) $ sieveOfEratosthenes 10000000
setPrimes = fromDistinctAscList primes

dropFromEnd _ []   = []
dropFromEnd 0 list = list
dropFromEnd n list = dropFromEnd (n-1) $ init list

truncatedNumbers n = leftToRight ++ rightToLeft
  where
    leftToRight = map (\n -> toInt $ drop n strn) [0..strlen-1]
    rightToLeft = map (\n -> toInt $ dropFromEnd n strn) [0..strlen-1]
    strn = show n
    strlen = length strn
    toInt n = read n :: Int

main = do
  print
    $ sum
    $ filter (not . trivial)
    $ map head
    $ filter (\numbers -> all (\n -> n `member` setPrimes) numbers)
    $ map truncatedNumbers primes
  where
    trivial 2 = True
    trivial 3 = True
    trivial 5 = True
    trivial 7 = True
    trivial _ = False

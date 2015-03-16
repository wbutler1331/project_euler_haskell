import Factory.Math.Implementations.Primes.SieveOfEratosthenes
import qualified Data.Set as S
import Core.Primality
import Core.List

corners = worker 3
  where
    worker n = [a,b,c,d] : worker (n+2)
      where
        a = d-(3*e)
        b = d-(2*e)
        c = d-e
        d = n^2
        e = n-1

isPrime = millerRabinPrimalityFor $ take 5 $ sieveOfEratosthenes 10

main = print
  $ (-)  -- turns out the side length can be calculated as (number_of_diagonals-(2*number_of_layers))
    ((snd $ last list)+4)   -- the number of diagonals in 1 layer out from the last elem found
    (2 * ((length list)+1)) -- the number of layers 1 layer out from the last elem in the list
  where
    list = takeWhile (\(primes, items) -> ((fromIntegral primes) / (fromIntegral items)) >= 0.1) -- the answer is one layer out from this
      $ tail -- skip the 0/0 arbitrary start
      $ scanl
        (\(primes, items) newCorners -> (primes + (length $ filter isPrime newCorners), items + 4)) -- accumulate the number of primes and the number of corners to avoid any recomputing
        (0,1) -- start with no primes and 1 item (because the first layer [1] is not computed in corners but has to be accounted for)
        corners

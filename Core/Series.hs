module Core.Series where

pentagonal = let worker n = ((n*(3*n-1))/2) : worker (n+1) in worker 1

triangular = let worker n = (n*(n+1))/2 : worker (n+1) in worker 1

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
module Core.Probability where

nCr n r = n' `div` r'
    where
    -- unroll just what you need and nothing more
    n' = product [n, n-1 .. n-r+1]
    r' = factorial r
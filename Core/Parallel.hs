module Core.Parallel where

-- used to force par and parseq to eval an entire list
-- as opposed to just evaluating to Weak Head Normal Form
-- which would only evaluate the outermost constructor
-- which for a list is [a], so if you have someComprehension `par` anotherComprehension
-- only the first item of someComprehension would be evaluated in parallel
force :: [a] -> ()
force xs = go xs `pseq` ()
    where go (_:xs) = go xs
          go [] = 1

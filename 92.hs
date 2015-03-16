import qualified Data.Map as M
import qualified Core.Map as CM
import Core.List

squareChain' = (worker 2 [] M.empty) -- start with the lowest possible startingNumber (1 just productes an infinite list)
	where
		worker startingNumber currentChain cache
			| startingNumber == limit = []
			| nextNumber == 89 = startingNumber : worker (startingNumber+1) [] (updateCache cache (startingNumber : currentChain) 89) --record the starting number, then call the worker with a new starting number, no current chain (because we're starting over) and a new cache with the whole previously calculated list in it
			| nextNumber == 1  = worker (startingNumber+1) [] (updateCache cache (startingNumber : currentChain) 1) -- dont record the starting number (it's 1, so we dont care about it at the moment), but call the worker again with a new currentChain (because we're starting over) and a cache with all numbers in the current chain recorded)
			| otherwise        = case M.lookup nextNumber cache of
														-- this number is already in the cache , so we dont have to add it, and we dont care about it, so just move on
														Just 1  -> worker (startingNumber+1) [] (updateCache cache currentChain 1)
														-- this number is already in the cache, so we dont have to add it, but we do care about it, so add it to the lis and move on
														Just 89 -> startingNumber : worker (startingNumber+1) [] (updateCache cache currentChain 89)
														-- not in the cache, so just add the next number to the chain and continue calculating
														Nothing -> worker startingNumber (nextNumber:currentChain) cache
			where
				limit = 10000000
				updateCache cache keys val = CM.addFromList cache $ zip keys [val,val..]
				nextNumber = sum $ map (\n -> (read [n])^2) $ show $ headOr startingNumber currentChain

main = print (length squareChain')

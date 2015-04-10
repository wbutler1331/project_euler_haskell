import Data.List
import qualified Data.Map as M
import Data.Maybe

data Perm = Perm {
  len  :: Int,
  freq :: M.Map Char Int
} deriving (Show)

instance Eq Perm where
  p1 == p2 = (len p1) == (len p2) && (freq p1) == (freq p2)

instance Ord Perm where
  compare p1 p2
    | comp /= EQ = comp
    | otherwise  = freqcomp p1 `compare` freqcomp p2
      where
        comp = (len p1) `compare` (len p2)
        freqcomp p = read (concat $ map (\key -> replicate (fromJust $ M.lookup key (freq p)) key) $ M.keys $ freq p) :: Int

toPerm n = let strn = show n in Perm (length strn) (M.fromList $ map (\group -> (head group, length group)) $ group $ sort strn)

fromPerm (Perm l f) = minimum $ map (\n -> read n :: Int) $ permutations $ M.keys f

findCubes n = last $ worker M.empty n
   where
     worker cache n = case M.lookup permn cache of
                       Just r  -> if length r == 4 then r else worker (M.insertWith (++) permn [cubeN] cache) (n+1)
                       Nothing -> worker (M.insert permn [cubeN] cache) (n+1)
                      where
                         permn = toPerm cubeN
                         cubeN = n^3

main = print $ findCubes 1

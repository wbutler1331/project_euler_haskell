module Core.Map where

import qualified Data.Map as M

addFromList m l = M.union m $ M.fromList l

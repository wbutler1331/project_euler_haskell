import Data.List

replacementIndexes n = [(start,end) | start <- [0..lenn], end <- [start..lenn]]
	where
		lenn = length strn
		strn = show n
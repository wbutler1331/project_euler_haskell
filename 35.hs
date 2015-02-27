import Numeric
import Data.Char

isPalindrome n = let strn = show n in (reverse strn) == strn
strIsPalindrome str = (reverse str) == str

toBinary n = showIntAtBase 2 intToDigit n ""

main = print $ sum $ [ x | x <- [1..1000000], isPalindrome x, strIsPalindrome $ toBinary x ]

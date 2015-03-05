import Core.Tests


main = print
  $ maximum
  $ [n1*n2 | n1 <- [100..999], n2 <- [100..999], isPalindrome (n1*n2) ]

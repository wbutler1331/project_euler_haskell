require './core'

palindromes = []

(100..999).each do |n1|
  (100..999).each do |n2|
    r = n1*n2
    palindromes << r if r.is_palindrome?
  end
end

puts palindromes.max

require './core'

s1 = (1..100).inject(:+)**2
s2 = (1..100).map { |n| n**2 }.inject(:+)

puts (s1 - s2)

require './core'
n  = 100.factorial.to_s.split(//).map(&:to_i).inject(:+)
puts n

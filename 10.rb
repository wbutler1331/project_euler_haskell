require './core'

n = (2..2_000_000).to_a.select(&:is_prime?).inject(:+)
puts n

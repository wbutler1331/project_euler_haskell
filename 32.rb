require './core'
pandigital_nums = (0..987654321).to_a.map(&pandigital)
puts (pandigital_nums.length)

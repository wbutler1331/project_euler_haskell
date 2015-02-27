require './core'

pairs = (2..10_000).map(&:amicable_pair)
puts "initial pairs #{pairs.length}"
pairs = pairs.select(&:not_nil?)
puts "pairs without nils #{pairs.length}"
pairs = pairs.inject(:+)
puts "individual numbers (not deduped) #{pairs.length}"
puts pairs
pairs = pairs.uniq
puts "deduped #{pairs.length}"
puts pairs
s   = pairs.inject(:+)
puts "sum: #{s}"

require './core'

ab = (12..28123).select(&:abundant?)
res = (12..28123).map { |n| n.can_be_written_as_sum_of_any? ab }

puts res.length
puts res.inject(:+)

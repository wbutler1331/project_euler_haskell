require './core'

r = (0..9).to_a.permutation.map do |a|
  a.join.to_i
end.sort[999_999]
puts r

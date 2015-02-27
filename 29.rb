require './core'
combos = []
(2..100).each do |a|
  (2..100).each do |b|
    combos << a**b
  end
end
puts combos.uniq.length

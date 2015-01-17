require './core'

max = 0
num = 0

(13..1_000_000).each do |n|
  len = n.collatz.length + 1
  if len > max
    max = len
    num = n
  end
end

puts num

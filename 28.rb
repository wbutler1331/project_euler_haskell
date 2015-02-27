def spiral n
  start = n
  corners = [start**2]
  side_len = n
  transitions = 0
  while corners[-1] > 1
    corners << corners[-1]-(side_len-1)
    transitions += 1
    if transitions % 4 == 0
      side_len -= 2
    end
  end
  corners
end

puts (spiral 1_001).inject(:+)

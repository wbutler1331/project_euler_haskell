require './core'

n = 0
while
  n += 1
  if n.is_triangular? and n.factors.inject(:+).length >= 500
    puts n
    break
  end
end

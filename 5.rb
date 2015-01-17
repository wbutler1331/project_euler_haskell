require './core'

n = 2520

while
  n+=20
  if n.divisible_by? 1..20
    puts n
    break
  end
end

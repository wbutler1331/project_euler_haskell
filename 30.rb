require './core'

n = 2

nums = []
if false
  #FIXME highly suspicious lol...figure out the upper bound and do the proper sum
  while true
    if n == n.to_s.split(//).map{|n|(n.to_i)**5}.inject(:+)
      puts "found one! #{n}"
      nums << n
    end
    n+=1
  end
end
results = [
  4150,
  4151,
  54748,
  92727,
  93084,
  194979
]

puts results.inject(:+)

require './core'

#using leonard dickson's method of generating pythagorean triplets

# 1) find integers such that

# r**2 == 2st

# 2) means find factors of (r **2 ) / 2

# 3) each factor will produce a triplet, s.t.

# a = r + s
# b = r + t
# c = r + s + t

(1..1000).each do |r| #has to be < 1000 ... probably smaller bound, but the problem shouldnt be intensive anyway
  ((r**2)/2).factors.each do |s,t|
    a,b,c = (r + s), (r + t), (r + s + t)
    puts a*b*c if a+b+c == 1000
  end
end

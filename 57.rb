def worker limit
	if limit > 0
		Rational(1,2+(worker (limit-1)))
	else
		0	
	end
end

def expansions limit
	r = worker limit
	1+r
end

matches = (1..1000).to_a.select do |n| 
	r = expansions n
	r.numerator.to_s.split(//).length > r.denominator.to_s.split(//).length
end

puts matches.length

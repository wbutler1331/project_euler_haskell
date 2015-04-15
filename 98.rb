def main
	words 	 = get_words "files/p098_words.txt"
	anagrams = get_anagrams words
	n = 10
	max = 0
	while true
		sq = n**2
		anagrams.each do |w1,w2|
			n2 = transform w1,w2,sq
			if n2 and perfect_square?(n2)
				largest = if n2 > sq then n2 else sq end
				max = largest if largest > max
			end
		end
		n += 1
		break if anagrams.all? do |w1,_|
			sq.to_s.length > w1.length
		end
	end
	puts max
end

def perfect_square? n
  sqrt = n ** 0.5
  sqrt - sqrt.to_i == 0
end

def transform w1, w2, n
	strn = n.to_s
	return nil if strn.length != w1.length
	subs = w1.split(//).zip strn.split(//)
	return nil if subs.group_by { |x| x[1] }.any? { |_,group| group.group_by { |x| x[0] }.length > 1 }
	lookup = Hash[subs]
	final = w2.split(//).map { |c| lookup[c] }
	return nil if final.first == "0"
	final.join.to_i
end

def get_words filename
	IO.read(filename).gsub("\"","").split(",")
end

def get_anagrams words
	h = Hash.new
	words.each do |word|
		c = word.split(//).sort
		r = h[c]
		if not r
			h[c] = [word]
		else
			h[c].push word
		end
	end
	h.select { |k,v| v.length > 1 }.map { |k,v| v.combination(2).to_a }.inject(:+)
end

main

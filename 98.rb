def main
	words 	 = get_words "p098_words.txt"
	anagrams = get_anagrams words
	n = 10
	max = 0
	while true
		sq = n**2
#		puts "[+] Trying #{sq}"
		anagrams.each do |w1,w2|
			n2 = transform w1,w2,sq
#			puts "[+] Transform is #{n2}"
			if n2 and perfect_square?(n2)
				puts "[+] #{sq} and #{n2} are perfect squares"
				largest = if n2 > sq then n2 else sq end
				max = largest if largest > max
				puts "[+] Found new largest: #{max}"

			end
		end
		n += 1
		break if anagrams.all? do |w1,_|
			sq.to_s.length > w1.length
		end
	end
end

def perfect_square? n
  sqrt = n ** 0.5
  sqrt - sqrt.to_i == 0
end

def transform w1, w2, n
	#puts "checking #{n} against #{w1} and #{w2}"
	#gets
	strn = n.to_s
	return nil if strn.length != w1.length
	subs = w1.split(//).zip strn.split(//)
	return nil if subs.group_by { |x| x[1] }.any? { |_,group| group.group_by { |x| x[0] }.length > 1 }
	lookup = Hash[subs]
	w2.split(//).map { |c| lookup[c] }.join.to_i
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

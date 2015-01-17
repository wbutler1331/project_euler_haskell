(1..999).to_a.map { |n| n if n % 3 == 0 or n % 5 == 0 }.select{|n|!n.nil?}.inject(:+)

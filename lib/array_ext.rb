class Array
	def takeWhile
		r = []
		self.each do |i|
			if not yield(i)
				break
			end
			r << i
		end
		r
	end

	def head
		self.first
	end

	def tail
		self.drop 1
	end

	def init
		self.take (self.length-1)
	end

	def consecutive_ascending?
		sorted = self.sort
		sorted.zip(sorted.tail).init.all? do |v1,v2|
			(v2-v1)==1
		end
	end

	def deltas arr2
		self.zip(arr2.sort).map { |a1,a2| a1-a2 }
	end
end

class String
	def is_num?
		!!Integer(self) rescue false
	end

	def init
		self.to_a.init.join ""
	end

	def last
		self.to_a.last
	end

	def first
		self.to_a.first
	end

	def head
		self.first
	end

	def tail
		sefl.to_a.tail.join ""
	end

	def to_a
		self.split(//)
	end
end

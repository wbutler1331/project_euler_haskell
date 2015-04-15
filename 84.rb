class Square
	def initialize code
		@code = code
	end

end

class Board
	def initialize codes
		@squares = codes.map {|c| Square.new c}
	end
end

class Player
	
end

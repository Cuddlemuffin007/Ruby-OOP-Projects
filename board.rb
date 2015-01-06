class Board
	attr_accessor :board, :empty_cell

	def initialize
		@empty_cell = "-"
		@board = Array.new(9, @empty_cell)
	end

	def draw
		puts "\n"
		@board.each_slice(3){|row| puts row.join(' | ')}
		puts "\n"
	end
	
end
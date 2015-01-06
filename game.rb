class Game
	require_relative 'board.rb'
	require_relative 'player.rb'

	def setup
		@player1 = Player.new
		puts "Enter Player 1 name:"
		@player1.name = gets.chomp.capitalize
		@player1.symbol = "X"

		@player2 = Player.new
		puts "Enter Player 2 name:"
		@player2.name = gets.chomp.capitalize
		@player2.symbol = "O"

		puts "#{@player1.name}, you are #{@player1.symbol}."
		puts "#{@player2.name}, you are #{@player2.symbol}."
	end

	def initialize
		@game = Board.new
		@game.draw
		self.setup
	end
end

test = Game.new
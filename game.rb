class Game
	require_relative 'board.rb'
	require_relative 'player.rb'

	@@wins = 
    [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], 
     [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
	 
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
		@winner = nil
		@current_turn = 1
		@game.draw
		self.setup
	end
	
	def play
	    start_playing
		show_result
	end
	
	def start_playing
	    take_turns until game_over
	end
	
	def take_turns
	    @current_turn.even? ? turn(@player1) : turn(@player2)
	end
	
	def turn(player)
	    show_turn(player)
		input = get_valid_cell
		if @game.update(input, player.symbol)
		  @current_turn += 1
		else
		  error = "That cell is invalid"
		end
		@game.draw
		puts error
		check_for_win(player)
	end
	
	#print current player and turn number
	def show_turn(player)
	  puts "Turn: #{@current_turn}\n"
	  print "#{player.name}, #{player.symbol}\n"
	end
	
	def get_valid_cell
		input = nil
		until(0..8).include?(input)
		  print "Enter your move (1-9): "
		  input = gets.chomp.to_i - 1
		end
		input
	end
	
	def check_for_win(player)
	  @@wins.each do |w|
	    @winner = player if w.all? {|a| @game.board[a] == player.symbol}
	  end
	end
	
	def game_over
	  @current_turn > 9 || @winner
	end
	
	def show_result
	  if @current_turn > 9 && !@winner
	    puts "It's a Draw"
	  else
	    puts "#{@winner.name} wins!"
	  end
	end
end

my_game = Game.new
my_game.play
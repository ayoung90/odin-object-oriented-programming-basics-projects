require_relative './board'
require_relative './player'
class Game
  def initialize(player1_name, player2_name)
    @board = Board.new
    @player1 = Player.new(player1_name, '+')
    @player2 = Player.new(player2_name, '-')
  end

  def check_winner
    puts 'Congrats this is a test'
    true
  end

  def turn; end

  def game_loop
    until check_winner
      @board.display
      @player1.turn
      @player2.turn
    end
  end
end

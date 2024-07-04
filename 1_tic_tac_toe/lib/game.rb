require_relative './board'

class Game
  def initialize
    @board = Board.new
  end

  def turn_and_check_winner(symbol, turn)
    @board.update(turn[0].to_i, turn[1].to_i, symbol)
    @board.display
    winner?(symbol)
  end

  def winner?(symbol)
    puts "#{symbol} has won!"
    true
  end

  def valid_move?(turn)
    @board.space_empty?(turn[0].to_i, turn[1].to_i)
  end
end

require_relative './board'
require_relative './player'

class Game
  def initialize
    @board = Board.new
  end

  def turn_and_check_winner(symbol, turn)
    @board.update(turn[0].to_i, turn[1].to_i, symbol)
    @board.display
  end

  def winner?(player)
    if @board.row_win?(player.symbol)
      # || @board.column_win?(player.symbol) || @board.diagonal_win?(player.symbol)

      puts "#{player.name} has won!"
      return true
    end
    false
  end

  def turn_input_to_array(name)
    print "#{name}: Please enter a x,y value: "
    gets.chomp.split(',')
  end

  def move(player)
    valid = false
    until valid
      x_y_input = turn_input_to_array(player.name)
      valid = valid_move?(x_y_input)
    end

    turn_and_check_winner(player.symbol, x_y_input)
  end

  def valid_move?(turn)
    @board.space_empty?(turn[0].to_i, turn[1].to_i)
  end
end

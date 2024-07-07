require_relative './board'
require_relative './player'

# Contains the game logic for tic tac toe
# e.g
# - Checking win conditions
# - Handling player moves
# - Managing updates to game board
class Game
  def initialize
    @board = Board.new
    @board.display # show empty board at the start of the game
  end

  # Set the specified symbol on the given location [x,y] array. Then show board
  def update_and_print_board(symbol, turn)
    @board.update(turn[0].to_i, turn[1].to_i, symbol)
    @board.display
  end

  # Check specific win condions for a player. A player wins if
  #  - all symbols horizontally or
  #  - all symbols vertically or
  #  - A diagonal
  def winner?(player)
    if @board.row_win?(player.symbol) ||
       @board.column_win?(player.symbol) ||
       @board.diagonal_win?(player.symbol)

      player.add_win
      puts "#{player.name} has won!"
      return true
    end
    false
  end

  # Prompts player until there is a valid input
  # Once received, updates the board
  def move(player)
    valid = false
    until valid
      x_y_input = turn_input_to_array(player.name)
      valid = valid_move?(x_y_input)
    end

    update_and_print_board(player.symbol, x_y_input)
  end

  # Ensures a turn can be made at that place.
  # - There should not already be a symbol there
  # - The place should exist (ie. not off the board!)
  def valid_move?(turn)
    @board.space_empty?(turn[0].to_i, turn[1].to_i)
  end

  # Handle draw conditions
  # - No more moves
  # - No possible wins - TODO
  def no_more_moves?
    if @board.board_full?
      puts 'Draw: board is full'
      return true
    end
    false
  end

  private

  # Helper. Prompts for input from player. "x,y", converts to array [x,y]
  def turn_input_to_array(name)
    print "#{name}: Please enter a x,y value: "
    gets.chomp.split(',')
  end
end

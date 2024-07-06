# Handles all functionality related to the tic tac toe board
# e.g
# - Printing board
# - Updating board
# - Checking if a symbol has met win conditions
class Board
  BOARD_SIZE = 3
  PLACEHOLDER = ' '

  def initialize
    @rows = Array.new(BOARD_SIZE, PLACEHOLDER) { Array.new(BOARD_SIZE, PLACEHOLDER) }
  end

  # Prints the board to the screen along with any moves taken
  #
  # TODO
  # - The board looks ok but not look great. lets improve once other functionality is done
  def display
    @rows.each do |row|
      row.each_with_index do |item, idx|
        print item
        print ' | ' unless idx == BOARD_SIZE - 1
      end
      puts
    end
  end

  # Updates a square of the board to the given symbol value
  #
  # TODO
  # - for some reason, the x,y are swapped. Lets fix it.
  # - Or change x,y  to row, column? in which we don't need to swap anything :)
  def update(x_axis, y_axis, symbol)
    @rows[x_axis - 1][y_axis - 1] = symbol
  end

  # Returns if a square on the board is empty
  # defined as:
  # - Containing the placeholder constant OR
  # - The square is off the board
  def space_empty?(x_axis, y_axis)
    return false if x_axis > BOARD_SIZE || y_axis > BOARD_SIZE

    @rows[x_axis - 1][y_axis - 1] == PLACEHOLDER
  end

  # A row win is all given symbol on spaces within a row
  # e.g
  # [X][X][X]
  # [_][_][_]
  # [_][_][_]
  def row_win?(symbol)
    @rows.each do |row|
      return true if row.all?(symbol)
    end
    false
  end

  # A column win is all given symbol on spaces within a column
  # e.g
  # [_][X][_]
  # [_][X][_]
  # [_][X][_]
  def column_win?(symbol)
    @rows.each_index do |idx|
      return true if @rows[0][idx] == symbol && @rows[1][idx] == symbol && @rows[2][idx] == symbol
    end
    false
  end

  # A diagonal win is all given symbol on either diagonal
  # e.g
  # [X][_][_] | [_][_][X]
  # [_][X][_] | [_][X][_]
  # [_][_][X] | [X][_][_]
  def diagonal_win?(symbol)
    return true if @rows[0][0] == symbol &&
                   @rows[1][1] == symbol &&
                   @rows[2][2] == symbol
    return true if @rows[0][2] == symbol &&
                   @rows[1][1] == symbol &&
                   @rows[2][0] == symbol

    false
  end
end

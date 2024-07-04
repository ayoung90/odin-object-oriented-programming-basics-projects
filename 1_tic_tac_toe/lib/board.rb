class Board
  BOARD_SIZE = 3
  PLACEHOLDER = ' '
  def initialize
    @rows = Array.new(BOARD_SIZE, PLACEHOLDER) { Array.new(BOARD_SIZE, PLACEHOLDER) }
  end

  def display
    @rows.each do |row|
      row.each_with_index do |item, idx|
        print item
        print ' | ' unless idx == BOARD_SIZE - 1
      end
      puts
    end
  end

  def update(x_axis, y_axis, symbol)
    @rows[x_axis - 1][y_axis - 1] = symbol
  end

  def space_empty?(x_axis, y_axis)
    return false if x_axis > BOARD_SIZE || y_axis > BOARD_SIZE

    @rows[x_axis - 1][y_axis - 1] == PLACEHOLDER
  end
end

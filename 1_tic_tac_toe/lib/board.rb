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

  def row_win?(symbol)
    @rows.each do |row|
      return true if row.all?(symbol)
    end
    false
  end

  def column_win?(symbol)
    @rows.each_idx do |idx|
      return true if
      @rows[0][idx] == symbol && @rows[1][idx] == symbol && @rows[2][idx] == symbol
    end
    false
  end

  def diagonal_win?(_symbol)
    false # todo
  end
end

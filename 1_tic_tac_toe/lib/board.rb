class Board
  BOARD_SIZE = 3
  def initialize
    @rows = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }
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
    @rows[x_axis][y_axis] = symbol
  end
end

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    self.name = name
    self.symbol = symbol
  end

  def turn
    puts "#{name} took a turn"
  end
end

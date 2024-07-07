# Represents a player of tic tac toe
class Player
  attr_accessor :name, :symbol, :wins

  def initialize(name, symbol)
    self.name = name
    self.symbol = symbol
    self.wins = 0
  end

  def add_win
    self.wins += 1
  end
end

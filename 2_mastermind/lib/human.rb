# Represents the Human of mastermind
class Human < Player
  attr_accessor :name

  def initialize(name)
    super
    self.name = name
  end
end

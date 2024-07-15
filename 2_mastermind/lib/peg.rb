# Represents a peg in mastermind
class Peg
  attr_accessor :colour

  def self.available_colours
    %w[blue orange green purple]
  end

  def self.colour_valid?(colour)
    available_colours.include?(colour)
  end

  def initialize(colour)
    self.colour = colour
  end
end

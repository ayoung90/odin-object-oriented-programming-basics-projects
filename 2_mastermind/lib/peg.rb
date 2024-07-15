# Represents a peg in mastermind
class HintPeg
  attr_accessor :colour

  def self.available_colours
    %w[blue orange green purple]
  end

  def self.colour_valid?(colour)
    available_colours.include?(colour)
  end

  def self.sample
    available_colours.sample
  end

  def initialize(colour)
    self.colour = colour
  end
end

# Represents a peg in mastermind
class Peg
  attr_accessor :colour

  def available_colours
    %w[Blue Orange Green Purple]
  end

  def colour_valid?(colour)
    available_colours.include?(colour)
  end

  def sample
    available_colours.sample
  end

  def initialize(colour)
    self.colour = colour
  end
end

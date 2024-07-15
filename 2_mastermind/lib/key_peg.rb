require_relative './peg'

# Represents a peg in mastermind
class KeyPeg < Peg
  def self.available_colours
    %w[red white]
  end

  def correct_colour_and_place?
    colour == 'red'
  end

  def correct_colour_incorrect_place?
    colour == 'white'
  end
end

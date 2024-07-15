require_relative './peg'

# Represents a peg in mastermind
class HintPeg < HintPeg
  def self.available_colours
    %w[blue orange green purple]
  end
end

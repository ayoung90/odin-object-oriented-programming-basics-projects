require_relative './peg'

# Represents a peg in mastermind
class CodePeg < HintPeg
  def self.available_colours
    %w[red white]
  end
end

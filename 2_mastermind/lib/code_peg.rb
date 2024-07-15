require_relative './peg'

# Represents a peg in mastermind
class CodePeg < Peg
  def self.available_colours
    %w[blue yellow green magenta]
  end

  def self.sample
    available_colours.sample
  end
end

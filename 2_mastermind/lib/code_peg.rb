require_relative './peg'

# Represents a peg in mastermind
class CodePeg < Peg
  def self.available_colours
    %w[blue orange green purple]
  end

  def self.sample
    available_colours.sample
  end
end

require_relative './board'
require_relative './human'
require_relative './peg'

# Contains the game logic for mastermind
class Game
  def initialize
    @board = Board.new
    @board.display # show empty board at the start of the game
  end

  def colour_valid?(colour)
    Peg.colour_valid?(colour)
  end

  def create_guess(colour1, colour2, colour3, colour4)
    [Peg.new(colour1), Peg.new(colour2), Peg.new(colour3), Peg.new(colour4)]
  end

  def random_maker
    maker = create_guess(Peg.sample, Peg.sample, Peg.sample, Peg.sample)

    @board.maker = maker
  end
end

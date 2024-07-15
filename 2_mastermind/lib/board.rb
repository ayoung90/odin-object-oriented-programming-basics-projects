require_relative './key_peg'

# Handles all functionality related to the mastermind board
# e.g
# - Printing board
# - Updating board
class Board
  # mastermind board size
  MAX_GUESSES = 8

  def initialize
    @rows = {}
    @code_maker = []
  end

  # Prints the board to the screen along with any hints
  # TODO enhance
  def display
    @rows.each do |row|
      puts row
    end
  end

  def current_guess
    @rows.keys.max || 0
  end

  # Adds a row to the board with both guess and hints
  def record_row(breaker)
    next_guess = current_guess + 1

    hints = calculate_hint(breaker)

    @rows[next_guess] = { breaker: breaker, hint: hints }
  end

  # Record the makers 4 pegs
  def maker=(maker)
    @code_maker = maker
  end

  # based a guess, calculate the hint flags. (red = right value, right position, white = right value, wrong position)
  # - Returns an array of hints. Always the same size as the guess
  #  - e.g ['red','red',nil,'white']
  def calculate_hint(guess)
    hints = []

    guess.each_with_index do |peg, idx|
      if peg.colour == @code_maker[idx].colour
        hints.push(KeyPeg.new('red'))
      elsif @code_maker.any? { |item| item.colour == peg.colour }
        hints.push(KeyPeg.new('white'))
      else
        hints.push(KeyPeg.new(nil))
      end
    end

    hints
  end

  # return if all hints are red in the latest guess
  def all_hints_red?
    @rows[current_guess][:hint].all?(&:correct_colour_and_place?)
  end

  # When we have recorded all guesses, the game is over
  def out_of_guesses?
    @rows.fetch(MAX_GUESSES, false)
  end
end

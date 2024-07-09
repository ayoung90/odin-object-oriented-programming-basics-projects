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
  def record_row(breaker, hint)
    next_guess = current_guess + 1

    @rows[next_guess] = { breaker: breaker, hint: hint }
  end

  # Record the makers 4 pegs
  def maker=(maker)
    @code_maker = maker
  end

  # When we have recorded all guesses, the game is over
  def out_of_guesses?
    @rows.fetch(MAX_GUESSES, false)
  end
end

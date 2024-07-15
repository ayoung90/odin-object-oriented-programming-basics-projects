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

    hint = calculate_hint(breaker)

    @rows[next_guess] = { breaker: breaker, hint: hint }
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
        hints.push('red')
      elsif @code_maker.any? { |item| item.colour == peg.colour }
        hints.push('white')
      else
        hints.push(nil)
      end
    end

    hints
  end

  # When we have recorded all guesses, the game is over
  def out_of_guesses?
    @rows.fetch(MAX_GUESSES, false)
  end
end

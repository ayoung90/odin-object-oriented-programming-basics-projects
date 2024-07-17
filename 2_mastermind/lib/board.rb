require_relative './key_peg'
require 'colorize'

# Handles all functionality related to the mastermind board
# e.g
# - Printing board
# - Updating board
class Board
  # mastermind board size
  MAX_GUESSES = 8 # 8 is the standard mastermind game. increase here for a longer game
  BOARD_SIZE = 6 # 4 # 4 is the normal board width. however, we can make it bigger

  def initialize
    @rows = []
    @code_maker = []
  end

  # Prints the board to the screen along with any hints
  def display
    @rows.reverse.each_with_index do |row, idx|
      print ' |'
      row[:breaker].each { |peg| print ' O '.colorize(color: peg.colour.to_sym, mode: :bold) }
      print ' | '
      row[:hint].each do |peg|
        if peg.colour.nil?
          print ' _ '
        else
          print ' o '.colorize(color: peg.colour.to_sym, mode: :bold)
        end
      end
      print ' <-- latest' if idx.zero?
      puts
    end

    puts
  end

  # what guess are we up to?
  def current_guess
    @rows.size - 1 || 0
  end

  # Adds a row to the board with both guess and hints
  def record_row(breaker)
    hints = calculate_hint(breaker)

    @rows.push({ breaker: breaker, hint: hints })
  end

  # Record the makers 4 pegs
  def maker=(maker)
    @code_maker = maker
  end

  # based on a guess, calculate the hint pegs.
  # - Options
  #  - red = right value, right position
  #  - white = right value, wrong position
  #  - nil = wrong colour
  #
  # Returns an array of hints. Always the same size as the guess
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
    @rows.size == MAX_GUESSES
  end
end

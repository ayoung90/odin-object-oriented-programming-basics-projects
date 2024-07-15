require_relative './board'
require_relative './human'
require_relative './code_peg'

# Contains the game logic for mastermind
class Game
  def initialize
    @board = Board.new
    @board.display # show empty board at the start of the game
  end

  def colour_valid?(colour)
    CodePeg.colour_valid?(colour)
  end

  def create_guess(colour1, colour2, colour3, colour4)
    [CodePeg.new(colour1), CodePeg.new(colour2), CodePeg.new(colour3), CodePeg.new(colour4)]
  end

  # Generate a set of colours for the user to break
  def random_maker
    maker = create_guess(CodePeg.sample, CodePeg.sample, CodePeg.sample, CodePeg.sample)

    @board.maker = maker
    puts 'The Computer has selected 4 colours'
  end

  def valid_move?(turn)
    return turn.size unless turn.size == 4

    turn.each do |colour|
      return colour unless CodePeg.colour_valid?(colour)
    end

    true
  end

  # Prompts player until there is a valid input
  def move(player)
    valid = false
    until valid
      colour_list = turn_input_to_array(player.name)
      valid = valid_move?(colour_list)

      # TODO: handle better
      if valid == colour_list.size
        puts "Error: #{colour_list.size} is too small. Need 4 colours"
        valid = false
      elsif valid != true
        puts "Error: #{valid} is not a colour in #{CodePeg.available_colours}"
        valid = false
      end

    end

    record_move(colour_list)
  end

  def record_move(colours)
    @board.record_row(create_guess(colours[0], colours[1], colours[2], colours[3]))

    @board.display # view the board for now
  end

  # the game is won once all the pegs are red in the latest guess
  def winner?(player)
    won = @board.all_hints_red?
    puts "You win #{player.name}!" if won

    won
  end

  def no_more_moves?
    @board.out_of_guesses?
  end

  private

  # Helper. Prompts for input from player. "blue, blue, blue, blue", converts to array ["blue", "blue", "blue", "blue"]
  def turn_input_to_array(name)
    print "#{name}: Please enter a list of 4 colours in #{CodePeg.available_colours} 'red,blue,red': "
    gets.chomp.delete(' ').split(',')
  end
end

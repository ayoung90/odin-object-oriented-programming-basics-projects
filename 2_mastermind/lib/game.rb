require_relative './board'
require_relative './human'
require_relative './code_peg'

# Contains the game logic for mastermind
class Game
  def initialize
    @board = Board.new
    @board.display # show empty board at the start of the game
  end

  # returns if the colour is from the allowed list
  def colour_valid?(colour)
    CodePeg.colour_valid?(colour)
  end

  # construct a guess (array of pegs) from an array of colours
  def create_guess(colours)
    colours.map { |colour| CodePeg.new(colour) }
  end

  # Generate a set of colours for the user to break
  def random_maker
    pegs = []
    Board::BOARD_SIZE.times do
      pegs.push(CodePeg.sample)
    end
    maker = create_guess(pegs)

    @board.maker = maker
    puts "The Computer has selected #{Board::BOARD_SIZE} colours"
  end

  # Ensures a move has
  #  - The right size (matches the board size)
  #  - The right colours (from the allowed list)
  def valid_move?(turn)
    return turn.size unless turn.size == Board::BOARD_SIZE

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
        puts "Error: #{colour_list.size} is too small. Need #{Board::BOARD_SIZE} colours"
        valid = false
      elsif valid != true
        puts "Error: #{valid} is not a colour in #{CodePeg.available_colours}"
        valid = false
      end

    end

    record_move(colour_list)
  end

  # store the move and output the board for the user
  def record_move(colours)
    @board.record_row(create_guess(colours))

    @board.display # view the board for now
  end

  # the game is won once all the pegs are red in the latest guess
  def winner?(player)
    won = @board.all_hints_red?
    puts "You win #{player.name}!" if won

    won
  end

  # check if we have reached the end of the game
  def no_more_moves?
    @board.out_of_guesses?
  end

  private

  # Helper. Prompts for input from player. "blue, blue, blue, blue", converts to array ["blue", "blue", "blue", "blue"]
  def turn_input_to_array(name)
    sample_input = "#{CodePeg.available_colours[2]}, #{CodePeg.available_colours[0]}, #{CodePeg.available_colours[2]}, #{CodePeg.available_colours[1]}"

    puts "#{name}: Please enter a list of #{Board::BOARD_SIZE} colours in #{CodePeg.available_colours}"
    print "e.g: #{sample_input}': "
    gets.chomp.delete(' ').downcase.split(',')
  end
end

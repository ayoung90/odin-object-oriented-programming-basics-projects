require_relative './lib/game'
require_relative './lib/player'

# create a basic game loop
new_game = true

def turn_input_to_array(name)
  print "#{name}: Please enter a x,y value: "
  gets.chomp.split(',')
end

while new_game
  puts 'Welcome to Tic Tac Toe'

  print 'Player1: Please enter your Name: '
  name = gets.chomp
  player1 = Player.new(name, '+')

  print 'Player2: Please enter your Name: '
  name = gets.chomp
  player2 = Player.new(name, '-')

  game = Game.new
  valid = false
  until valid
    x_y_input = turn_input_to_array(player1.name)
    valid = game.valid_move?(x_y_input)
  end
  game.turn_and_check_winner(player1.symbol, x_y_input)
  x_y_input = turn_input_to_array(player1.name)
  game.turn_and_check_winner(player2.symbol, x_y_input)

  new_game = false
end

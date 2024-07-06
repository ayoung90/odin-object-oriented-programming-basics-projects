require_relative './lib/game'
require_relative './lib/player'

# create a basic game loop
new_game = true

puts 'Welcome to Tic Tac Toe'

print 'Player1: Please enter your Name: '
name = gets.chomp
player1 = Player.new(name, 'X')

print 'Player2: Please enter your Name: '
name = gets.chomp
player2 = Player.new(name, 'O')

while new_game

  game = Game.new

  while loop
    game.move(player1)
    break if game.winner?(player1)

    game.move(player2)
    break if game.winner?(player2)
  end

  new_game = false
end

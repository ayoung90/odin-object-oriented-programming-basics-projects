require_relative './lib/game'
require_relative './lib/player'

# create a basic game loop
new_game = true

puts 'Welcome to MasterMind'

print 'Player: Please enter your Name: '
name = gets.chomp
player = Player.new(name, 'X')

# Check with the user if they want to play again
def restart_game?
  options = { Y: true, N: false }
  valid = false
  until valid
    print 'Do you want to play again (Y, N)?: '
    again = gets.chomp.upcase.to_sym

    valid = options.key?(again)
  end

  options.fetch(again, false)
end

# output scores for both players
# def print_score(player1, player2)
#   puts ' **********************'
#   puts ' * Scores'
#   puts " * #{player1.name} => #{player1.wins} | #{player2.name} => #{player2.wins}"
#   puts ' **********************'
# end

while new_game

  game = Game.new

  # print_score(player1, player2)

  # TODO: Mastermind game loop
  while loop
    game.move(player1)
    break if game.winner?(player1) || game.no_more_moves?

    game.move(player2)
    break if game.winner?(player2) || game.no_more_moves?
  end

  new_game = restart_game?
end

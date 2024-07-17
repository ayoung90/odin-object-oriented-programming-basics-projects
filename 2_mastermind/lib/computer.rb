# Represents the Computer of mastermind
require_relative '../lib/player'

class Computer < Player
  attr_accessor :name

  def initialize
    super
  end
end

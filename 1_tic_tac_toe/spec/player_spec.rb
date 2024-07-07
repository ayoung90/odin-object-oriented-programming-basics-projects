require 'spec_helper'
require_relative '../lib/player'

RSpec.describe 'Player' do
  name = 'Test'
  symbol = 'X'
  player = Player.new(name, symbol)
  describe 'check player values' do
    it 'Check name' do
      expect(player.name).to eq(name)
    end

    it 'Check symbol' do
      expect(player.symbol).to eq(symbol)
    end

    it 'Ensure wins initialised to 0' do
      expected_wins = 0
      expect(player.wins).to eq(expected_wins)
    end
  end

  describe 'Check player methods' do
    it 'increment score' do
      expected_wins = 1
      player.add_win
      expect(player.wins).to eq(expected_wins)
    end
  end
end

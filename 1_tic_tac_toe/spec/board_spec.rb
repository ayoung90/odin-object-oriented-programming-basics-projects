require_relative 'spec_helper'
require_relative '../lib/board'

RSpec.describe 'Board' do
  describe 'Check board methods' do
    # TODO: complete unit tests for all methods

    it 'Update board' do
      board = Board.new

      x = 1
      y = 1
      symbol = '@'

      expect(board.space_empty?(x, y)).to eq(true)
      board.update(x, y, symbol)
      expect(board.space_empty?(x, y)).to eq(false)
    end

    it 'Board full' do
      board = Board.new
      symbol = '@'

      expect(board.board_full?).to eq(false) # board should be empty on creation
      3.times do |x|
        3.times do |y|
          board.update(x, y, symbol)
        end
      end

      expect(board.board_full?).to eq(true) # board should be full after updates
    end
  end
end

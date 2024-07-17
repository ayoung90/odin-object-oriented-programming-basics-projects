require_relative 'spec_helper'
require_relative '../lib/human'

RSpec.describe 'Human' do
  name = 'Test'
  human = Human.new(name)
  describe 'check human values' do
    it 'Check name' do
      expect(human.name).to eq(name)
    end
  end
end

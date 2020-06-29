require './spec/spec_helper.rb'
require './lib/franc.rb'

RSpec.describe Franc do
  describe '#times' do
    let(:five) { Franc.new(5) }

    context '5フランを2倍するとき' do
      it '10フランになる' do
        expect(five.times(2).equals(Franc.new(10))).to be true
      end
    end

    context '5フランを3倍するとき' do
      it '15フランになる' do
        expect(five.times(3).equals(Franc.new(15))).to be true
      end
    end
  end

  describe '#equals' do
    it '5フランは5フランと等価である' do
      expect(Franc.new(5).equals(Franc.new(5))).to be true
    end

    it '5フランは6フランと等価でない' do
      expect(Franc.new(5).equals(Franc.new(6))).to be false
    end
  end
end

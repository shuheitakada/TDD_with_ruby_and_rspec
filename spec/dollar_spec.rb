require './spec/spec_helper.rb'
require './lib/dollar.rb'

RSpec.describe Dollar do
  describe '#times' do
    let(:five) { Dollar.new(5) }

    context '5ドルを2倍するとき' do
      let(:product) { five.times(2) }

      it '10ドルになる' do
        expect(product.amount).to eq 10
      end
    end

    context '5ドルを3倍するとき' do
      let(:product) { five.times(3) }

      it '15ドルになる' do
        expect(product.amount).to eq 15
      end
    end
  end

  describe '#equals' do
    it '5ドルは5ドルと等価である' do
      expect(Dollar.new(5).equals(Dollar.new(5))).to be true
    end

    it '5ドルは6ドルと等価でない' do
      expect(Dollar.new(5).equals(Dollar.new(6))).to be false
    end
  end
end

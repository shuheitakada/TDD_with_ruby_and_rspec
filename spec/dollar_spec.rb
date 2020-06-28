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
end

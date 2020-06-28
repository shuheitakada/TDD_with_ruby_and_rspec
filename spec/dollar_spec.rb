require './spec/spec_helper.rb'
require './lib/dollar.rb'

RSpec.describe Dollar do
  describe '#times' do
    let(:five) { Dollar.new(5) }

    context '5ドルを2倍するとき' do
      before do
        five.times(2)
      end

      it '10ドルになる' do
        expect(five.amount).to eq 10
      end
    end
  end
end

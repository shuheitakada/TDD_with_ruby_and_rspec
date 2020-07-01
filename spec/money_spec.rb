require './spec/spec_helper.rb'
require './lib/money.rb'

RSpec.describe Money do
  describe '#times' do
    let(:five_dollar) { Dollar.new(5) }
    let(:five_franc) { Franc.new(5) }

    it 'X倍できる' do
      expect(five_dollar.times(2).equals(Dollar.new(10))).to be true
      expect(five_dollar.times(3).equals(Dollar.new(15))).to be true
      expect(five_franc.times(2).equals(Franc.new(10))).to be true
      expect(five_franc.times(3).equals(Franc.new(15))).to be true
    end
  end

  describe '#equals' do
    it '等価であればtrueを返す' do
      expect(Dollar.new(5).equals(Dollar.new(5))).to be true
      expect(Franc.new(5).equals(Franc.new(5))).to be true
    end

    it '等価でなければfalseを返す' do
      expect(Dollar.new(5).equals(Dollar.new(6))).to be false
      expect(Franc.new(5).equals(Franc.new(6))).to be false
    end

    context '違う通貨と比較するとき' do
      it '5ドルと5フランは等価でない' do
        expect(Dollar.new(5).equals(Franc.new(5))).to be false
      end
    end
  end
end

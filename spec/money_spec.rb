require './spec/spec_helper.rb'
require './lib/money.rb'

RSpec.describe Money do
  describe '#times' do
    let(:five_dollar) { Money.dollar(5) }
    let(:five_franc) { Money.franc(5) }

    it 'X倍できる' do
      expect(five_dollar.times(2).equals(Money.dollar(10))).to be true
      expect(five_dollar.times(3).equals(Money.dollar(15))).to be true
      expect(five_franc.times(2).equals(Money.franc(10))).to be true
      expect(five_franc.times(3).equals(Money.franc(15))).to be true
    end
  end

  describe '#equals' do
    it '等価であればtrueを返す' do
      expect(Money.dollar(5).equals(Money.dollar(5))).to be true
    end

    it '等価でなければfalseを返す' do
      expect(Money.dollar(5).equals(Money.dollar(6))).to be false
    end

    context '違う通貨と比較するとき' do
      it '5ドルと5フランは等価でない' do
        expect(Money.dollar(5).equals(Money.franc(5))).to be false
      end
    end
  end

  describe '#currency' do
    it '単位を表示する' do
      expect(Money.dollar(5).currency).to eq 'USD'
      expect(Money.franc(5).currency).to eq 'CHF'
    end
  end
end

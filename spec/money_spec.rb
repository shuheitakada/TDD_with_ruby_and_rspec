require './spec/spec_helper.rb'
require './lib/money.rb'

RSpec.describe Money do
  describe '#plus' do
    it '足し算ができる' do
      five = Money.dollar(5)
      sum = five.plus(five)
      bank = Bank.new
      reduced = bank.reduce(sum, 'USD')
      expect(reduced.equals(Money.dollar(10))).to eq true
    end

    it '#plusはSumのインスタンスを返す' do
      five = Money.dollar(5)
      sum = five.plus(five)
      expect(sum.class).to eq Sum
    end
  end

  describe '#times' do
    let(:five_dollar) { Money.dollar(5) }

    it 'X倍できる' do
      expect(five_dollar.times(2).equals(Money.dollar(10))).to be true
      expect(five_dollar.times(3).equals(Money.dollar(15))).to be true
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

RSpec.describe Bank do
  describe '#reduce' do
    it '外貨両替できる' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, 'USD')
      expect(Money.dollar(7).equals(result)).to be true
    end
  end
end

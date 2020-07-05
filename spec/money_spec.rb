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

    it '異なる通貨で足し算ができる' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.franc(10)
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      result = bank.reduce(five_bucks.plus(ten_francs), 'USD')
      expect(result.equals(Money.dollar(10))).to eq true
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

RSpec.describe Sum do
  describe '#plus' do
    it '足し算ができる' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.franc(10)
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
      result = bank.reduce(sum, 'USD')
      expect(result.equals(Money.dollar(15))).to be true
    end
  end

  describe '#times' do
    it '掛け算ができる' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.franc(10)
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      sum = Sum.new(five_bucks, ten_francs).times(2)
      result = bank.reduce(sum, 'USD')
      expect(result.equals(Money.dollar(20))).to be true
    end
  end
end

RSpec.describe Bank do
  describe '#reduce' do
    it 'Sumのインスタンスを換算できる' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, 'USD')
      expect(Money.dollar(7).equals(result)).to be true
    end

    it 'Moneyのインスタンスを換算できる' do
      bank = Bank.new
      result = bank.reduce(Money.dollar(1), 'USD')
      expect(Money.dollar(1).equals(result))
    end

    it 'Moneyを異なる通貨に換算できる' do
      bank = Bank.new
      bank.add_rate('CHF', 'USD', 2)
      result = bank.reduce(Money.franc(2), 'USD')
      expect(Money.dollar(1).equals(result)).to be true
    end
  end

  describe '#rate' do
    it '同一通貨の場合は1を返す' do
      expect(Bank.new.rate('USD', 'USD')).to eq 1
    end
  end
end

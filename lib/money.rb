class Money
  attr_reader :amount
  attr_reader :currency
  protected :amount

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end

  def plus(addend)
    Money.new(amount + addend.amount, currency)
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def equals(other_money)
    amount == other_money.amount && currency == other_money.currency
  end
end

class Expression
  def initialize(money)
  end
end

class Bank
  def reduce(source, to)
    Money.dollar(10)
  end
end

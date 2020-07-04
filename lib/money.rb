class Money
  attr_reader :amount
  attr_reader :currency

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
    Sum.new(self, addend)
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def equals(other_money)
    amount == other_money.amount && currency == other_money.currency
  end
end

class Sum
  attr_accessor :augend
  attr_accessor :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to)
    amount = augend.amount + addend.amount
    Money.new(amount, to)
  end
end

class Bank
  def reduce(source, to)
    source.reduce(to)
  end
end

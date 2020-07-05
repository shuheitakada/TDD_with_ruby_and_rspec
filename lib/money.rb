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

  def reduce(bank, to)
    Money.new(amount / bank.rate(currency, to), to)
  end
end

class Sum
  attr_reader :augend
  attr_reader :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def times(multiplier)
    Sum.new(augend.times(multiplier), addend.times(multiplier))
  end

  def reduce(bank, to)
    amount = augend.reduce(bank, to).amount + addend.reduce(bank, to).amount
    Money.new(amount, to)
  end
end

class Bank
  def initialize
    @exchange_rate = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = Hash.new(0) } }
  end

  def add_rate(from, to, rate)
    @exchange_rate[from][to] = rate
  end

  def rate(from, to)
    return 1 if from == to

    @exchange_rate[from][to]
  end

  def reduce(source, to)
    source.reduce(self, to)
  end
end

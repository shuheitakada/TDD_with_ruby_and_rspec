class Money
  attr_reader :amount
  attr_reader :currency
  protected :amount

  class << self
    def dollar(amount)
      Dollar.new(amount, 'USD')
    end

    def franc(amount)
      Franc.new(amount, 'CHF')
    end
  end

  def equals(other_money)
    self.class == other_money.class && amount == other_money.amount
  end
end

class Dollar < Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.dollar(amount * multiplier)
  end
end

class Franc < Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.franc(amount * multiplier)
  end
end

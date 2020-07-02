class Money
  attr_reader :amount
  protected :amount

  class << self
    def dollar(amount)
      Dollar.new(amount)
    end

    def franc(amount)
      Franc.new(amount)
    end
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def equals(other_money)
    self.class == other_money.class && amount == other_money.amount
  end
end

class Dollar < Money
  attr_reader :currency

  def initialize(amount)
    @amount = amount
    @currency = 'USD'
  end
end

class Franc < Money
  attr_reader :currency

  def initialize(amount)
    @amount = amount
    @currency = 'CHF'
  end
end

class Money
  attr_reader :amount
  protected :amount

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def equals(other_money)
    self.class == other_money.class && amount == other_money.amount
  end
end

class Dollar < Money
  def initialize(amount)
    @amount = amount
  end
end

class Franc < Money
  def initialize(amount)
    @amount = amount
  end
end
